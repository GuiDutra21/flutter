import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'product.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém a lista de produtos
class ProductList with ChangeNotifier {
  // Atributos
  final List<Product> _items = [];

  // OBS: sempre lembrar que no final precisa colocar o .json
  final _url =
      'https://store-flutter-7a5b7-default-rtdb.firebaseio.com/products.json';

  // Getter que retorna uma cópia do atributo _items,
  // sendo que outras classes não conseguem alterar a lista origial
  List<Product> get items => [..._items];

  // Getter que retorna apenas os porodutos marcados como favoritos, obs: retorna uma cópia da lista original
  List<Product> get favoriteItems =>
      [..._items].where((product) => product.isFavorite).toList();

  int get itemsLength => _items.length;

  Future<void> loadProducts() async {
    _items.clear(); // Para não ficar gerando produtos duplicados

    final response = await get(Uri.parse(_url));
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
      Uri.parse(_url),
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

  Future<void> updateProduct(Product product) {
    int index = _items.indexWhere((p) =>
        p.id ==
        product
            .id); // Para capturar o índice desse produto na lista de produtos
    if (index >= 0) {
      _items[index] = product;
    }
    notifyListeners();

    return Future.value();
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((p) =>
        p.id ==
        product
            .id); // Para capturar o índice desse produto na lista de produtos
    if (index >= 0) {
      _items.removeWhere((p) => p.id == product.id);
    }
    notifyListeners();
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