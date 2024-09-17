import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

// Classe que representa cada quadrado com a imagem
class ProductItem extends StatelessWidget {

  // Atributo
  final Product product;

  // Construtor
  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect( // Para arredondar as bordas
      borderRadius: BorderRadius.circular(10),
      
      // Widget responsável por gerar um bloco de grade 
      child: GridTile(

        // Parte inferior do gridTile
        footer: GridTileBar(
          backgroundColor: Colors.black54,

          // Ícone da esquerda
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.red,)),
          
          // Título
          title: FittedBox(
              child: Text(
            product.name,
            textAlign: TextAlign.center,
          )),

          // Ícone da direita
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart,color: Colors.amber ,)),
        ),

        
        // Imagem 
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
          
          // Bolinha de carregamento
          loadingBuilder: (context, child, loadingProgress)
          {
            return loadingProgress  == null ? 
            child : const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.black ,
                strokeWidth: 7,
              ),
            );
          },
        ),
      ),
    );
  }
}
