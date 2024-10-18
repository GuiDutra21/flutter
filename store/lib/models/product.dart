// Classe modelo de produtos
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Product with ChangeNotifier {
  // Atriibutos
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  // Construtor
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageUrl,
      this.isFavorite = false});

  void _toggleFavorite()
  {
    isFavorite = !isFavorite;
    notifyListeners();
  }
  Future <void> toggleFavorite() async{
    
    
    try
    {
      _toggleFavorite();
      final response = await patch(
        Uri.parse(
            'https://store-flutter-7a5b7-default-rtdb.firebaseio.com/products/$id.json'),
        body: jsonEncode({'isFavorite': isFavorite}),
      );

      if(response.statusCode >= 400)
      {
        _toggleFavorite();
      }
    }
    catch (_)
    {
      _toggleFavorite();
    }
  }
}
