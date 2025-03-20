import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/auth.dart';
import 'package:store/models/product.dart';
import 'package:store/utils/app_routes.dart';

import '../models/cart.dart';

// Classe que representa cada quadrado com a imagem na tela principal
class ProductGridItem extends StatelessWidget {
  // Construtor
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Produto oriundo da instância criada no ProductGrid através do ChangeNotifierProvider.value
    final product = Provider.of<Product>(
      context,
      // Se [listen] for verdadeiro, alterações de valor posteriores acionarão um novo [State.build] para widgets e [State.didChangeDependencies] para [StatefulWidget].
      // OBS: por padrão tem o valor de true
      listen: false,
    );

    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

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
                      product.toggleFavorite(
                        auth.token ?? '',
                        auth.userId ?? '',
                      );
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
          title: AutoSizeText(
            product.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25), // Defina o tamanho de texto máximo desejado
            maxLines: 1, // Limita o texto a uma linha
            overflow:
                TextOverflow.ellipsis, // Adiciona reticências quando necessário
            minFontSize: 10, // Defina o tamanho mínimo do texto
            maxFontSize: 20, // Tamanho máximo do texto
          ),

          // Ícone da direita
          trailing: IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.amber,
              size: 25,
            ),
            onPressed: () {
              // Para apenas mostrar o snackBar atual
              ScaffoldMessenger.of(context).hideCurrentSnackBar();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green[500],
                  content: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Adicionado com sucesso!",
                        ),
                      ),
                      SnackBarAction(
                        backgroundColor: Colors.red[700],
                        textColor: Colors.white,
                        label: "DESFAZER?",
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        },
                      ),
                    ],
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );

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
          // Animação para aparecer uma imagem Default enquanto a real não carrega, mas ta com erro
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder:
                  const AssetImage("assets/images/product-placeholder.png"),
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          // child: Image.network(
          //   product.imageUrl,
          //   fit: BoxFit.cover,

          //   // Bolinha de carregamento da imagem
          //   loadingBuilder: (context, child, loadingProgress) {
          //     return loadingProgress == null
          //         ? child
          //         : const Center(
          //             child: CircularProgressIndicator(
          //               color: Colors.green,
          //               backgroundColor: Colors.black,
          //               strokeWidth: 7,
          //             ),
          //           );
          //   },
          // ),
        ),
      ),
    );
  }
}
