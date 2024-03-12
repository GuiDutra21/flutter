import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../models/product_list.dart';

// classe referente ao layout em matriz
class ProductGrid extends StatelessWidget
{ 
  // Construtor
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context)
  {
    // primeiro pega a classe 'criada' pelo provider
    final provider = Provider.of<ProductList>(context);
    // pega a lista dentro dessa classe
    final loadedProducts = provider.items;
    
    // Widget que gera o layout de matriz
    return GridView.builder(
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, index) => ChangeNotifierProvider(
          create: (_) => loadedProducts[index], // elmento 'criado' pelo provider
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