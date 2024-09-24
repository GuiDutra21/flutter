import 'package:flutter/material.dart';
import 'package:store/data/dummy_data.dart';

import '../models/product.dart';

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
  
  void addProduct(Product product )
  {
    _items.add(product);
    notifyListeners(); // para notificar os interessados
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