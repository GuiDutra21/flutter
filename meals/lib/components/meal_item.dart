import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/meal.dart';

// Classe que representa a foto das refeições e mais alguns pequenos detalhes
class MealItem extends StatefulWidget
{
  // Atributo
  final Meal meal;

  // Construtor
  const MealItem({required this.meal, super.key});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  
  // Função que direciona para a tela de detalhes da refeição quando clicamos numa refeição
  void _selectMeal(BuildContext context)
  {
    Navigator.of(context).pushNamed(
      AppRoutes.meals_details,
      arguments: widget.meal 
      );
  }

  @override
  Widget build(BuildContext context)
  { 
    return InkWell( // Para poder ser clicável
      onTap:() => _selectMeal(context),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 5,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        margin: const EdgeInsets.all(10),

        child: Column(
          children: [
          Stack( // Para colocar os elementos um encima do outro
            children: [

              ClipRRect( // Para gerar uma borda na imagem
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),

                child: Image.network(
                  widget.meal.imageUrl,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : const Center(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.amber,
                      ),
                    );
                  },
                  // height: 300,
                  // width: double.infinity,
                  // fit: BoxFit.cover, // Para caber na imagem
                ),
              ),

              Positioned( // Para ter um posicionamento absoluto em relação a imagem
                right: 0,
                bottom: 15,
                child: Container( // Parte preta que vem atrás do nome
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 2,
                  ),
                  width: widget.meal.title.length.toDouble() * 17 > 300? 300 : widget.meal.title.length.toDouble() * 17 ,
                  color: Colors.black54,

                  child: Text( // Nome das refeições
                    widget.meal.title,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ],
          ),

          // Parte inferior com os ícones e os detalhes de tempo, dificuldade e preço
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Row( // Tempo
                  children:[
                    const Icon(Icons.schedule),
                    const SizedBox(width: 6), // Só para espaçar o ícone do texto
                    Text("${widget.meal.duration} min")
                  ]
                ),

                Row( // Dificuldade
                  children: [
                    const Icon(Icons.construction_outlined),
                    const SizedBox(width: 6), // Só para espaçar o ícone do textos
                    Text(widget.meal.complexityText)
                  ]
                ),

                Row( // Preço
                  children: [
                    const Icon(Icons.attach_money),
                    Text(widget.meal.costText,
                    style: const TextStyle(fontSize: 15),
                    ),
                  ]
                ),
              ],
          ),
          ),
        ],
        )
      ),
    );
  }
}