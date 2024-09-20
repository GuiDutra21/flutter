import 'package:flutter/material.dart';
import 'package:store/data/dummy_data.dart';

import '../models/product.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém a lista de produtos
class ProductList with ChangeNotifier
{
  // Atributo
  final List<Product> _items = dummyProducts;

  // Retorna uma cópia do atributo _items,
  // sendo que outras classes não conseguem alterar a lista origial
  List<Product> get items => [..._items];

  void addProduct(Product product )
  {
    _items.add(product);
    notifyListeners(); // para notificar os interessados
  }
}