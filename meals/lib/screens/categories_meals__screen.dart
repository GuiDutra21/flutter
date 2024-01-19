import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import '../models/category.dart';

// Tela que representa os pratos de uma determinada categoria
class CategoriesMealsScreen extends StatelessWidget
{
  const CategoriesMealsScreen({super.key});

  @override
  Widget build (BuildContext context)
  {
    // Maneira de obter a categoria sem precisar passar via construtor
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // Pega apenas as refeições correspponde a categoria
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    } ,).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true, // Para centralizar o texto no android
      ),
      

      // Gera uma lista com as Refeições 
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(meal:categoryMeals[index])),
    );
  }
}