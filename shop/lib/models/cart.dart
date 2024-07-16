import 'dart:math';

import 'package:flutter/material.dart';
import '/models/cart_item.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  // retorna apenas uma cópia dos dados
  Map<String, CartItem> get items => {..._items};

  int get itemsCount 
  {
    return _items.length;
  }

  double get totalAmount
  {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
     });
     return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existing) => CartItem(
                id: existing.id,
                productId: existing.productId,
                name: existing.name,
                quantity: existing.quantity + 1,
                price: existing.price,
              ));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                name: product.name,
                price: product.price,
                productId: product.id,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
