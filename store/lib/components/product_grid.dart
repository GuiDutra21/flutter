import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/product_list.dart';
import 'product_item.dart';

// Classe que representa a matriz de componentes
class ProductGrid extends StatelessWidget {
  // Construtor
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessa o provider
    final ProductList provider = Provider.of<ProductList>(context);

    // Acessa a lista de produtos que está dentro do provider
    final List<Product> productList = provider.items;

    // Widget responsável por criar a lyout em matriz
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: productList.length,
      itemBuilder: (context, index) => ChangeNotifierProvider(
          create: (_) => productList[index], // Cria o ChangeNotifier para a classe que contém o dado (quase isso nessa parte)
          child: const ProductItem()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
    );
  }
}
