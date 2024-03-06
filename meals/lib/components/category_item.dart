import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/category.dart';

// Classe que representa cada retângulo da tela principal
class CategoryItem extends StatelessWidget{

  // Atributo
  final Category category;

  //Construtor
  const CategoryItem(this.category, {super.key});

  // Função que é chamada quando clicamos em uma categoria
  void _selectCategory(BuildContext context, Category category)
  {
    Navigator.of(context).pushNamed(
      AppRoutes.categories_meals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context)
  { 
    // Widget que permite que o container seja clicável, ter uma pequena 'animiação' e ter uma função associada ao clique
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectCategory(context, category),
      splashColor: Colors.pink, // cor da pequena 'animação'

      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( // Classe que gera o efeito do gradiente
            colors: [
            category.color.withOpacity(0.7),
            category.color.withOpacity(0.8),
            category.color.withOpacity(0.9),
            category.color,
            ],
            stops: const [ 0.3, 0.5, 0.7, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),

        // Nomes das categorias
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(category.title, style: Theme.of(context).textTheme.titleLarge,)),
        
      ),
    );
  }
}