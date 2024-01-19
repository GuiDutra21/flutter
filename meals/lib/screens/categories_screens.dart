import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../components/category_item.dart';

// Classe que representa a tela inicial com as opções
class CategoriesScreens extends StatelessWidget
{
  const CategoriesScreens({super.key});

  @override
  Widget build (BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Vamos Cozinhar ?",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // Para centralizar o texto no android
      ),

      body: GridView( // Widget responsável por criar esse layout em formato de matriz
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories.map((category){
          return CategoryItem(category); // Itera sobre os dados mocados e chama cada retângulo
        }).toList(),
      ),
    );
  }
}