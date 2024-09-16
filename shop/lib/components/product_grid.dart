import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../models/product_list.dart';

// Classe referente ao layout em matriz
class ProductGrid extends StatelessWidget
{ 

  // Atributo 
  final bool showFavoriteOnly;

  // Construtor
  const ProductGrid({super.key, required this.showFavoriteOnly});

  @override
  Widget build(BuildContext context)
  {
    // Primeiro pega a classe 'criada' pelo provider
    final provider = Provider.of<ProductList>(context);

    // Pega a lista dentro dessa classe
    final loadedProducts = showFavoriteOnly ?  provider.favoriteItems : provider.items;
    
    // Widget que gera o layout de matriz
    return GridView.builder(
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          // apenas acessando o elemento, não criando, pois já tinha sido criado anteriormente
          // pelo provider mais acima
          value: loadedProducts[index], 
          child: const ProductItem(),
          ),
        itemCount: loadedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        );
  }
}