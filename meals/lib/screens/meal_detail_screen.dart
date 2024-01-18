import 'package:flutter/material.dart';
import '../models/meal.dart';

// Classe que representa os detalhes de uma determianda refeição
class MealDetailScreen extends StatelessWidget
{
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
  
  final meal = ModalRoute.of(context)?.settings.arguments as Meal;
  final double containerHeight = meal.ingredients.length * 41.1;

    return Scaffold( // Nome da refeição
      appBar: AppBar(
      title: Text(meal.title),
      ),

      body: Column(
        children: <Widget>[
          
          //Imagem
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: 
             const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          // Somente o texto : 'Ingredientes'
          Container(
            margin: const EdgeInsets.symmetric(
            vertical: 10
            ),
            child: Text("Ingredientes", style: Theme.of(context).textTheme.titleLarge),
          ),
          
          // Retângulo dos ingredientes
          Container(
            width: 300,
            height: containerHeight > 255 ? 255: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index)
            {
              return Card(
                color: Theme.of(context).canvasColor,
                child: Center(
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                    child: Text(meal.ingredients[index])),
                ),
              );
            }),
          )
        ]
      )
    );
  }
}