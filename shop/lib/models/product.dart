import 'package:flutter/material.dart';

// Classe modelo de produtos
class Product with ChangeNotifier{

  // Atriibutos
  final String id; 
  final String name; 
  final String description; 
  final double price; 
  final String imageUrl; 
  bool isFavorite;

  // Construtor
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false
  });

  // Método
  void toggleFavorite()
  {
     isFavorite = !isFavorite;
     notifyListeners();
  }
}