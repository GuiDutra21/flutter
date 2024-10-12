import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/data/dummy_data.dart';

import 'product.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém a lista de produtos
class ProductList with ChangeNotifier
{
  // Atributos
  final List<Product> _items = dummyProducts;

  // Getter que retorna uma cópia do atributo _items,
  // sendo que outras classes não conseguem alterar a lista origial
  List<Product> get items => [..._items];

  // Getter que retorna apenas os porodutos marcados como favoritos, obs: retorna uma cópia da lista original
  List<Product> get favoriteItems => [..._items].where((product) => product.isFavorite).toList();
  
  int get itemsLength => _items.length;

  void saveProduct(Map <String, Object> data)
  { 
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'].toString() : Random().nextInt(1000).toString(),
      name: data['name'].toString(),
      price: data['price'] as double,
      description: data['description'].toString(),
      imageUrl: data['imageUrl'].toString(),
    );

    if(hasId)
      updateProduct(product);
    else
      addProduct(product);

  }

  void addProduct(Product product )
  {
    _items.add(product);
    notifyListeners(); // para notificar os interessados
  }
  void updateProduct(Product product )
  {
    int index = _items.indexWhere((p) =>p.id == product.id); // Para capturar o índice desse produto na lista de produtos
    if(index >= 0)
    {
      _items[index] = product;
    }
    notifyListeners();
  }

   void removeProduct(Product product)
  {
    int index = _items.indexWhere((p) =>p.id == product.id); // Para capturar o índice desse produto na lista de produtos
    if(index >= 0)
    {
      _items.removeWhere((p) =>p.id == product.id);
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