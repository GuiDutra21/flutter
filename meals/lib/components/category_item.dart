import 'package:flutter/material.dart';
import '../models/category.dart';

// Classe que representa cada retângulo da tela principal

class CategoryItem extends StatelessWidget{
  final Category category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient( // Classe que gera o efeito do gradiente
          colors: [
          category.color,
          category.color.withOpacity(0.5),
          ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge,)),
      
    );
  }
}