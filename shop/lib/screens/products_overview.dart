import 'package:flutter/material.dart';
import 'package:shop/components/product_item.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';

// Classe que represena a tela pricinpal
class ProductsOverview extends StatelessWidget {

  // Contrutor
  const ProductsOverview({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    // lista dos produtos
    final List<Product> loadedProducts = dummyProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha loja"),
      ),

      // Widget que gera o laout de matriz
      body: GridView.builder(
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, index) => (ProductItem(product: loadedProducts[index])),
        itemCount: loadedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        ),
    );
  }
}
