import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/meal.dart';

// Classe que representa a tela das refeições favoritas
class FavoriteScreen extends StatelessWidget
{

  final List<Meal> favorites;
  const FavoriteScreen(this.favorites, {super.key});

  @override
  Widget build(BuildContext context)
  { 
    
    return  favorites.isEmpty ? const Center(
        child: Text("Nenhuma refeição foi selecionada como favorita"),
    ) : ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
         return MealItem(meal: favorites[index]);
       },
    );
  }

}