// Classe modelo de produtos
import 'package:flutter/material.dart';

class Product  with ChangeNotifier  {

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

  void toggleFavorite()
  {
    isFavorite = !isFavorite; 
    notifyListeners();
  }
}