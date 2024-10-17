import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:store/exceptions/http_exception.dart';

import 'product.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém a lista de produtos
class ProductList with ChangeNotifier {
  // Atributos
  final List<Product> _items = [];

  final _baseUrl =
      'https://store-flutter-7a5b7-default-rtdb.firebaseio.com/products';

  // Getter que retorna uma cópia do atributo _items,
  // sendo que outras classes não conseguem alterar a lista origial
  List<Product> get items => [..._items];

  // Getter que retorna apenas os porodutos marcados como favoritos, obs: retorna uma cópia da lista original
  List<Product> get favoriteItems =>
      [..._items].where((product) => product.isFavorite).toList();

  int get itemsLength => _items.length;

  Future<void> loadProducts() async {
    _items.clear(); // Para não ficar gerando produtos duplicados

    final response = await get(Uri.parse(
        '$_baseUrl.json')); // OBS: sempre lembrar que no final precisa colocar o .json
    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((productId, productData) {
      _items.add(Product(
          id: productId,
          name: productData['name'],
          price: productData['price'],
          description: productData['description'],
          imageUrl: productData['imageUrl']));
    });
    notifyListeners();
  }

  Future<void> saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'].toString() : Random().nextInt(1000).toString(),
      name: data['name'].toString(),
      price: data['price'] as double,
      description: data['description'].toString(),
      imageUrl: data['imageUrl'].toString(),
    );

    if (hasId)
      return updateProduct(product);
    else
      return addProduct(product);
  }

  Future<void> addProduct(Product product) async {
    final response = await post(
      // com o await ele espera o retorno para só depois executar o restante
      Uri.parse(
          '$_baseUrl.json'), // OBS: sempre lembrar que no final precisa colocar o .json
      body: jsonEncode({
        'name': product.name,
        'price': product.price,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'isFavorite': product.isFavorite,
      }),
    );
    var id = jsonDecode(response.body)['name'];
    _items.add(Product(
        id: id,
        name: product.name,
        price: product.price,
        description: product.description,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite));
    notifyListeners(); // para notificar os interessados
  }

  Future<void> updateProduct(Product product) async {
    int index = _items.indexWhere((p) =>
        p.id ==
        product
            .id); // Para capturar o índice desse produto na lista de produtos

    if (index >= 0) {
      await patch(
        Uri.parse(
            '$_baseUrl/${product.id}.json'), // OBS: Nessa URL precisamos passar qual o produto que será alterado
        body: jsonEncode({
          'name': product.name,
          'price': product.price,
          'description': product.description,
          'imageUrl': product.imageUrl,
        }),
      );
      _items[index] = product;
    }
    notifyListeners();

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
            '$_baseUrl/${product.id}.json'), // OBS: Nessa URL precisamos passar qual o produto que será removido
      );

      // Se der errado reinsere o produto e chama a exception
      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException( // Necessário para passar a exception
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