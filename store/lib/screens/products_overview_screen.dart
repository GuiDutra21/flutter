import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/components/product_grid.dart';
import 'package:store/components/shopping_cart.dart';
import 'package:store/utils/app_routes.dart';

import '../models/cart.dart';

enum Favorite { all, onlyFavorite }

// Classe que representa a tela com todos os produtos
class ProductsOverviewScreen extends StatefulWidget {
  // Construtor
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _onlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Loja"),
          actions: [
            // ícone no appBar que gera um pop up menu responsável por alternar entre os favoritos ou todos
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      // Pop Up para mostrar apenas os produtos favoritos
                      PopupMenuItem(
                        value: Favorite.onlyFavorite,
                        onTap: () {
                          setState(() {
                            _onlyFavorite = true;
                          });
                        },
                        child: const Text("Apenas favoritos"),
                      ),

                      // Pop Up para mostrar todos os produtos
                      PopupMenuItem(
                        value: Favorite.all,
                        onTap: () {
                          setState(() {
                            _onlyFavorite = false;
                          });
                        },
                        child: const Text("Todos"),
                      )
                    ]),

            // O consumer permite que as alterações feitas no cart sejam refletidas na interface gráfica,
            // mas somente nessa parte
            Consumer<Cart>(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.cart);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                    )),
                builder: (context, cart, child) => ShoppingCart(
                    value: cart.itemsLength.toString(), child: child!))
          ],
        ),

        // Chama o componente da matriz dos produtos
        body: ProductGrid(
          onlyFavorite: _onlyFavorite,
        ),
        drawer: const AppDrawer(),);
  }
}
