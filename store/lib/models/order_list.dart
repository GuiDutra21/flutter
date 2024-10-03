import 'dart:math';

import 'package:flutter/material.dart';
import 'cart.dart';
import 'order.dart';

// Classe que representa a lista com todos os carrinhos ja criados
class OrderList with ChangeNotifier {

  List<Order> _items = [];

  List<Order> get items => [..._items];

  int get itemsLength => _items.length;

  void addOrder(Cart cart) {
    if(cart.items.isNotEmpty)
    {
      _items.insert(
        0,
        Order(
            id: (Random().nextInt(10000)).toString(),
            total: cart.totalAmount,
            products: cart.items.values.toList(),
            date: DateTime.now()),
      );
    }
    notifyListeners();
  }
}
