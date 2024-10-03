import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/utils/app_routes.dart';

import '../models/cart.dart';

// Classe que representa cada quadrado com a imagem
class ProductGridItem extends StatelessWidget {
  // Construtor
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Produto oriundo da instância criada no ProductGrid através do ChangeNotifierProvider.value
    final product = Provider.of<Product>(
      context,
      // caso for false, as alterações realizadas nesse atributo não serão refletidas na interface gráfica
      // obs: por padrão tem o valor de true
      listen: false,
    );
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      // Para arredondar as bordas
      borderRadius: BorderRadius.circular(10),

      // Widget responsável por gerar um bloco de grade
      child: GridTile(
        // Parte inferior do gridTile
        footer: GridTileBar(
          backgroundColor: Colors.black54,

          // O consumer permite que as alterações feitas no product sejam refletidas na interface gráfica,
          // mas somente nessa parte
          leading: Consumer<Product>(
            builder: (context, value, _) =>

                // Ícone da esquerda
                IconButton(
                    onPressed: () {
                      product.toggleFavorite();
                    },
                    icon: product.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 25,
                          )),
          ),

          // Título
          title: FittedBox(
              child: Text(
            product.name,
            textAlign: TextAlign.center,
          )),

          // Ícone da direita
          trailing: IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.amber,
              size: 25,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green[500],
                content: const Text(
                  "Adicionado com sucesso !",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                    backgroundColor: Colors.red[700],
                    textColor: Colors.white,
                    label: "DESFAZER ?",
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    }),
              ));
              cart.addItem(product);
            },
          ),
        ),

        // Imagem
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.productDetail, arguments: product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,

            // Bolinha de carregamento
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
