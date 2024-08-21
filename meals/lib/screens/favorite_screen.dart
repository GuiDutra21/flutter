import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/meal.dart';

// Classe que representa a tela das refeições favoritas
class FavoriteScreen extends StatefulWidget {
  // Atributo
  final List<Meal> favorites;

  // Construtor
  const FavoriteScreen(this.favorites, {super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela
    var screenWidth = MediaQuery.of(context).size.width;

    // Caso esteja vazia
    return widget.favorites.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Text(
                "Nenhuma refeição foi selecionada ainda como favorita!",
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // 7% da largura da tela
                  // fontSize: 40, // 5% da largura da tela
                ),
                textAlign: TextAlign.center, // Centraliza o texto
              ),
            ),
          )
        : ListView.builder(
            itemCount: widget.favorites.length,
            itemBuilder: (context, index) {
              return MealItem(meal: widget.favorites[index]);
            },
          );
  }
}