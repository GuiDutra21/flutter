import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/models/product_list.dart';

import '../components/product_item.dart';
import '../utils/app_routes.dart';

// Tela de gerenciar produtos
class ProductsScreen extends StatelessWidget {

  // Construtor
  const ProductsScreen({super.key});

  // Para carregar os produtos quando arrastar para cima
  Future<void> _refreshProducts(BuildContext context)
  {
    return Provider.of<ProductList>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    
    // Lista com os produtos
    final products = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciar Produtos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.productsForm);
              },
              icon: const Icon(Icons.add), color: Colors.black,)
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () =>  _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) => Column(children: [
              ProductItem(product: products.items[index]),
              const Divider(),
            ]),
            itemCount: products.itemsLength,
          ),
        ),
      ),

      drawer: const AppDrawer(),
    );
  }
}
