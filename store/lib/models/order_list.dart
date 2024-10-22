import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../constantes/const.dart';
import 'cart.dart';
import 'order.dart';

// Classe que representa a lista com todos os carrinhos ja criados
class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items => [..._items];

  int get itemsLength => _items.length;

  Future<void> addOrder(Cart cart) async {
    if (cart.items.isNotEmpty) {
      final date = DateTime.now();
      final response = await post(
        Uri.parse(
            '${Const.orderBaseUrl}.json'), // OBS: sempre lembrar que no final precisa colocar o .json
        body: jsonEncode({
          'total': cart.totalAmount,
          'date': date.toIso8601String(),
          'products': cart.items.values
              .map((cartItem) => {
                    'id': cartItem.id,
                    'productId': cartItem.productId,
                    'name': cartItem.name,
                    'price': cartItem.price,
                    'quantity': cartItem.quantity,
                  })
              .toList(),
        }),
      );

      final id = jsonDecode(response.body)['name'];
      _items.insert(
        0,
        Order(
            id: id,
            total: cart.totalAmount,
            products: cart.items.values.toList(),
            date: date),
      );
    }
    notifyListeners();
  }
}
