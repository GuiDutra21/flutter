import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'product.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém a lista de produtos
class ProductList with ChangeNotifier
{ 
  // atributo
  final List<Product> _items = dummyProducts;

  
  // retorna uma cópia do atributo _items,
  // sendo que outras classes não conseguem alterar a lista origial
  List<Product> get items => [..._items];

  // Para retornar apenas a lista com os favoritos
  List<Product> get favoriteItems => _items.where((product) => product.isFavorite).toList();
  
  void addProduct (Product product)
  {
    _items.add(product);
    notifyListeners(); // para notificar os interessados
  }
}