import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_amount.dart';
import 'package:shop/util/app_routes.dart';
import '../components/product_grid.dart';
import '../models/cart.dart';

// Enum para o filtro
enum FilterOptions {
  favorites,
  all,
}

// Classe que representa a tela pricinpal
class ProductsOverviewScreen extends StatefulWidget {
  // Contrutor
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minha loja",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          // ícone no appBar que gera um pop up menu responsável por alternar entre os favoritos ou todos
          PopupMenuButton(
            icon: const Icon(Icons.filter_alt_sharp),
            elevation: 30,
            color: Colors.white,
            itemBuilder: (_) => [
              // Opções do pop up menu
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text("Apenas favoritos"),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text("Todos"),
              )
            ],

            // Função a ser executada dependendo da opção escolhida
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.all) {
                  _showFavoriteOnly = false;
                } else {
                  _showFavoriteOnly = true;
                }
              });
            },
          ),
          // O consumer permite que as alterações feitas no cart sejam refletidas na interface gráfica,
          // mas somente nessa parte
          Consumer<Cart>(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                       AppRoutes.cart                 
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              builder: (context, cart, child) => CartAmount(
                    value: cart.itemsCount.toString(),
                    child: child!,
                  ))
        ],
      ),
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ), // Componente referente ao layout em matriz
    );
  }
}
