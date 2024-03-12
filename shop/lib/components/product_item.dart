import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/util/app_routes.dart';

import '../models/product.dart';

// Classe que representa o retângulo de cada produto
class ProductItem extends StatelessWidget {

  // Construtor
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {

    // elemento vindo da 'criação' o provider
    final product = Provider.of<Product>(context);
    
    // Widget responsável por gerar a borda
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),

        // Widget repsonsável por dectar o click na tela e chamar a função do onTap
        child: GestureDetector(
          onTap: () { Navigator.of(context).pushNamed(
            AppRoutes.productDetail,
            arguments: product,
          );},

      // Bloco dentro do gridView
      child: GridTile(

        // Rodapé do bloco(ícone de coração, nome e ícone do carrinho)
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
          title: FittedBox(
              child: Text(
            product.title,
            textAlign: TextAlign.center,
          )),
          trailing: IconButton(
            onPressed: () {},
            icon:  const Icon(Icons.shopping_cart, color: Colors.amber,),
          ),
        ),

          // Imagem com a bolinha de carregamento
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
      ),
    );
  }
}
