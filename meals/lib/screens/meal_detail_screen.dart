import 'package:flutter/material.dart';
import '../models/meal.dart';

// Classe que representa os detalhes de uma determianda refeição
class MealDetailScreen extends StatelessWidget
{
  final void Function(Meal) _toggleFavorite;
  final bool Function(Meal) _isFavorite;
  const MealDetailScreen(this._toggleFavorite,this._isFavorite, {super.key});

  Widget _createTitle(BuildContext context, String title)
  {
    return Container(
      margin: const EdgeInsets.symmetric(
      vertical: 10
      ),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _createContainer({required Widget child, required double containerHeight})
  {
    return  Container(
            height: containerHeight > 255 ? 255: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.fromLTRB(45,10,45,30),
            child: child,
    );
  }

  @override
  Widget build(BuildContext context)
  {
  
  final meal = ModalRoute.of(context)?.settings.arguments as Meal;
  final double containerHeight = meal.ingredients.length * 41.1;

    return Scaffold( // Nome da refeição
      appBar: AppBar(
      title: Text(meal.title),
      centerTitle: true, // Para centralizar o texto no android
      ),
      

      body: SingleChildScrollView(
        child: Column(
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
            _createTitle(context, "Ingredientes"),
            
            // Retângulo dos ingredientes
            _createContainer(
              containerHeight: containerHeight, 
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
              }
            ), 
            ),
        
            // Somente o texto: 'Passos'
            _createTitle(context,"Passos"),
        
            // Retângulo dos passos
            _createContainer(
              containerHeight: containerHeight,
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index)
                {
                  return Column(
                    children: <Widget>[ 
                      ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    // Apenas para não aparecer a linha depois do último passo
                    if(index != meal.steps.length - 1) 
                      const Divider(color: Colors.black45,indent: 16, endIndent:16,)
                    ],
                  );
                },
              )
              ),
            // Apenas para dar um espaço da parte inferior do celular
             Container(height: 30)
          ]
        ),
      ),

      // ícone de favorito
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: _isFavorite(meal) ? const Icon(Icons.star,color: Colors.black) : const Icon(Icons.star_border,color: Colors.black),
        onPressed: () => _toggleFavorite(meal),
      ),
    );
  }
}