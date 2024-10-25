import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:store/models/cart_item.dart';
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
        0, // indice
        Order(
            id: id,
            total: cart.totalAmount,
            products: cart.items.values.toList(),
            date: date),
      );
    }
    notifyListeners();
  }

  Future<void> loadOrders() async {
    _items.clear(); // Para não ficar gerando pedidos duplicados

    final response = await get(Uri.parse('${Const.orderBaseUrl}.json'));

    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((orderId, orderData) {
      _items.add(Order(
          id: orderId,
          total: orderData['total'],
          date: DateTime.parse(orderData['date']),
          products: (orderData['products'] as List<dynamic>).map((item) {
            return CartItem(
                id: item['id'],
                name: item['name'],
                price: item['price'],
                productId: item['productId'],
                quantity: item['quantity']);
          }).toList()));
    });
    notifyListeners();
  }
}
