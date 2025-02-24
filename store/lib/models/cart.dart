import 'dart:math';

import 'package:flutter/material.dart';

import 'cart_item.dart';
import 'product.dart';

// Classe modelo que representa/simula uma compra com os itens(Cart_item)
class Cart with ChangeNotifier {
  
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemsLength => _items.length;

  // Retorna o valor total do carrinho
  double get totalAmount {
    double total = 0.0;
    _items.values.forEach((item) {
      total += item.price * item.quantity;
    });
    return total;
    // return _items.values.fold(0.0,(total,item) => total + item.price * item.quantity);
  }

  // Adiciona um produto na variável
  void addItem(Product product) {

    // se já existir aquele item apenas aumenta a quantidade
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (oldItem) => CartItem(
              id: oldItem.id,
              productId: oldItem.productId,
              name: oldItem.name,
              price: oldItem.price,
              quantity: oldItem.quantity + 1));
    } else {
      // Cado contrário cria um novo CartItem
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: (Random().nextInt(10000)).toString(),
                productId: product.id,
                name: product.name,
                price: product.price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]?.quantity == 1) {
      removeItem(productId);
    } else {
      // Apenas retira um da quantidade
      _items.update(
          productId,
          (oldItem) => CartItem(
              id: oldItem.id,
              productId: oldItem.productId,
              name: oldItem.name,
              price: oldItem.price,
              quantity: oldItem.quantity - 1));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
