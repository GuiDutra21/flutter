import 'package:flutter/material.dart';

// Classe que representa as Categorias e seus atributos
class Category {

  // Atributos
  final String id;
  final String title;
  final Color color;

  // Construtor
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange
  });
}