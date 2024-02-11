import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/meal.dart';

// Classe que representa a tela das refeições favoritas
class FavoriteScreen extends StatelessWidget
{
  // Atributo
  final List<Meal> favorites;
  
  // Construtor
  const FavoriteScreen(this.favorites, {super.key});

  @override
  Widget build(BuildContext context)
  { 
    // Caso esteja vazia
    return  favorites.isEmpty ? const Center(
        child: Text("Nenhuma refeição foi selecionada como favorita !"),
    ) : ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
         return MealItem(meal: favorites[index]);
       },
    );
  }

}