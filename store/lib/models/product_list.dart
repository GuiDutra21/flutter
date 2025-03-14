import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:store/exceptions/http_exception.dart';

import '../constantes/const.dart';
import 'product.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém a lista de produtos
class ProductList with ChangeNotifier {
  // Atributos
  final String _token;
  final String _userId;
  List<Product> _items = [];

  // Construtor
  ProductList([this._token = '', this._userId = '', this._items = const []]);

  // Getter que retorna uma cópia do atributo _items,
  // sendo que outras classes não conseguem alterar a lista origial
  List<Product> get items => [..._items];

  // Getter que retorna apenas os porodutos marcados como favoritos, obs: retorna uma cópia da lista original
  List<Product> get favoriteItems =>
      [..._items].where((product) => product.isFavorite).toList();

  int get itemsLength => _items.length;

  // Recupera os produtos do back e armazena na variável _items
  Future<void> loadProducts() async {
    _items.clear(); // Para não ficar gerando produtos duplicados

    // Faz a requisição ao Back
    final response = await get(Uri.parse(
        '${Const.productBaseUrl}.json?auth=$_token')); // OBS: sempre lembrar que precisa colocar o .json
    // Foi acrescentado o ?auth=$_token para validar o acesso aos dados
    if (response.body == 'null') return;

    // Para recuperar os produtos que o usuário marcou como favorito
    final favoriteResponse = await get(Uri.parse(
        '${Const.userFavoritesUrl}/$_userId.json?auth=$_token')); // OBS: sempre lembrar que precisa colocar o .json

    Map<String, dynamic> favoriteData = favoriteResponse.body == 'null'
        ? {}
        : jsonDecode(favoriteResponse.body);

    // Acrescenta na variável _items cada produto recuperado na requisição
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((productId, productData) {
    final isFavorite = favoriteData[productId] ?? false; // Para atribuir corretamenta o favoito a cada produto
      _items.add(Product(
        id: productId,
        name: productData['name'] ?? '',
        price: productData['price']?.toDouble() ?? 0.0,
        description: productData['description'] ?? '',
        imageUrl: productData['imageUrl'] ?? '',
        isFavorite: isFavorite
      ));
    });

    notifyListeners(); // Notifica os 'interessados'
  }

  // Salva os produtos no back
  Future<void> saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'].toString() : Random().nextInt(1000).toString(),
      name: data['name'].toString(),
      price: data['price'] as double,
      description: data['description'].toString(),
      imageUrl: data['imageUrl'].toString(),
    );

    // Se é um produto novo apenas sava, caso contrário atualiza
    if (hasId)
      return updateProduct(product);
    else
      return addProduct(product);
  }

  // Adiciona um novo produto
  Future<void> addProduct(Product product) async {
    // Manda a requisição
    final response = await post(
      // com o await ele espera o retorno para só depois executar o restante
      Uri.parse(
          '${Const.productBaseUrl}.json?auth=$_token'), // OBS: sempre lembrar que precisa colocar o .json
      body: jsonEncode({
        'name': product.name,
        'price': product.price,
        'description': product.description,
        'imageUrl': product.imageUrl,
      }),
    );

    var id = jsonDecode(
        response.body)['name']; // Pega o id gerado automaticamente pelo back
    _items.add(Product(
      id: id,
      name: product.name,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
    ));

    notifyListeners(); // Notifica os 'interessados'
  }

  // Atualiza o produto
  Future<void> updateProduct(Product product) async {
    int index = _items.indexWhere((p) =>
        p.id ==
        product
            .id); // Para capturar o índice desse produto na lista de produtos

    if (index >= 0) {
      await patch(
        Uri.parse(
            '${Const.productBaseUrl}/${product.id}.json?auth=$_token'), // OBS: Nessa URL precisamos passar qual o produto que será alterado
        body: jsonEncode({
          'name': product.name,
          'price': product.price,
          'description': product.description,
          'imageUrl': product.imageUrl,
        }),
      );
      _items[index] = product;
    }
    notifyListeners(); // Notifica os 'interessados'

    return Future.value();
  }

  Future<void> removeProduct(Product product) async {
    int index = _items.indexWhere((p) =>
        p.id ==
        product
            .id); // Para capturar o índice desse produto na lista de produtos

    if (index >= 0) {
      _items.remove(product);
      notifyListeners();

      final response = await delete(
        Uri.parse(
            '${Const.productBaseUrl}/${product.id}.json?auth=$_token'), // OBS: Nessa URL precisamos passar qual o produto que será removido
      );

      // Se der errado reinsere o produto na variável _items e chama a exception
      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException(
            // Necessário para passar a exception
            message: 'Não foi possível excluir o produto',
            statusCode: response.statusCode);
      }
    }
  }
}


// List<Product> get items {
//     if(_onlyFavorite) return [..._items].where((product) => product.isFavorite).toList();
//       return [..._items];
//   } 

//   void onlyShowFavorite()
//   {
//     _onlyFavorite = true;
//     notifyListeners();
//   }

//   void showAll()
//   {
//     _onlyFavorite = false;
//     notifyListeners();
//   }