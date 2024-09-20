import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/utils/app_routes.dart';

// Classe que representa cada quadrado com a imagem
class ProductItem extends StatelessWidget {


  // Construtor
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {

  // Atributo
  final Product product = Provider.of(context);
    
  return ClipRRect( // Para arredondar as bordas
    borderRadius: BorderRadius.circular(10),
    
    // Widget responsável por gerar um bloco de grade 
    child: GridTile(

      // Parte inferior do gridTile
      footer: GridTileBar(
        backgroundColor: Colors.black54,

        // Ícone da esquerda
        leading:
            IconButton(onPressed: () {product.toggleFavorite(); }, icon: product.isFavorite ?  const Icon(Icons.favorite, color: Colors.red,) :  const Icon(Icons.favorite_border, color: Colors.red,)),
        
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
      child: GestureDetector(
        onTap: () { 
          Navigator.of(context).pushNamed(
          AppRoutes.productDetail,
          arguments: product
        );
        },
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
      ),
    );
  }
}
