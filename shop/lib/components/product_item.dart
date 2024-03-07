import 'package:flutter/material.dart';

import '../models/product.dart';

// Classe que representa o retângulo de cada produto
class ProductItem extends StatelessWidget {
  // Atributo
  final Product product;

  // Construtor
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    //
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
      
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          title: FittedBox(
              child: Text(
            product.title,
            textAlign: TextAlign.center,
          )),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.black,
                      strokeWidth: 7,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
