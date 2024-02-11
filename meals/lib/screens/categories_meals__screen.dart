import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

// Tela que representa os pratos de uma determinada categoria
class CategoriesMealsScreen extends StatelessWidget
{

  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build (BuildContext context)
  {
    // Maneira de obter a categoria sem precisar passar via construtor
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // Pega apenas as refeições correspponde a categoria
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    } ,).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true, // Para centralizar o texto no android
      ),
      

      // Gera uma lista com as Refeições 
      body: categoryMeals.isNotEmpty ? ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(meal:categoryMeals[index]))
        : Container( // Caso esteja vazio por conta dos filtros
          margin: const EdgeInsets.fromLTRB(15, 50, 15, 20),
          child: Card(
            color:  Colors.amber,
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.black ,size: 30),
              title: Text("Dado os filtros selecionados, nenhuma comida dessa categoria está disponível !",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),),
            ),
          ),
          )
    );
  }
}