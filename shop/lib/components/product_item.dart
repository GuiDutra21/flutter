import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/util/app_routes.dart';

import '../models/cart.dart';
import '../models/product.dart';

// Classe que representa o retângulo de cada produto
class ProductItem extends StatelessWidget {
  // Construtor
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    // elemento vindo da 'criação' o provider
    final product = Provider.of<Product>(
      context,
      // caso for false, as alterações realizadas nesse atributo não serão refletidas na interface gráfica
      // obs: por padrão tem o valor de true
      listen: false,
    );
    // final cart = Provider.of<Cart>(
    //   context,
    //   listen: false,
    // );

    // Widget responsável por gerar a borda
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),

      // Widget repsonsável por dectar o click na tela e chamar a função do onTap
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.productDetail,
            arguments: product,
          );
        },

        // Bloco dentro do gridView
        child: GridTile(
          // Rodapé do bloco(ícone de coração, nome e ícone do carrinho)
          footer: GridTileBar(
            backgroundColor: Colors.black54,

            // O consumer permite que as alterações feitas no product sejam refletidas na interface gráfica,
            // mas somente nessa parte
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                onPressed: () {
                  product.toggleFavorite();
                },
                icon: product.isFavorite
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(
                        Icons.favorite_border,
                      ),
              ),
            ),
            title: FittedBox(
                child: Text(
              product.name,
              textAlign: TextAlign.center,
            )),

            // O consumer permite que as alterações feitas no cart sejam refletidas na interface gráfica
            // mas somente nessa parte
            trailing: Consumer<Cart>(
              builder: (context, cart, child) => IconButton(
                onPressed: () {
                  cart.addItem(product);
                },
                icon: Icon(
                cart.items.containsKey(product.id)?
                  Icons.shopping_cart: 
                  Icons.shopping_cart_outlined,
                  color: Colors.amber,
                ),
              ),
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
