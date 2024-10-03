import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/product_list.dart';
import 'product_grid_item.dart';

// Classe que representa a matriz de componentes
class ProductGrid extends StatelessWidget {

  // Atributo
  final bool onlyFavorite;

  // Construtor
  const ProductGrid({super.key,required this.onlyFavorite});


  @override
  Widget build(BuildContext context) {

    // Acessa o provider
    final provider = Provider.of<ProductList>(context);

    // Acessa a lista de produtos que está dentro do provider
    final List<Product> productList = onlyFavorite ? provider.favoriteItems : provider.items;
   
    // Widget responsável por criar a lyout em matriz
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productList.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: productList[index], 
            // está reusando o ChangeNotifier, nesse caso ele está meio que instanciando cada produto da lista de produtos, sendo que cada um deles será usado no ProductItem
              child:  ProductGridItem()), // OBS: não coloque o const aqui, se não vai dar erro na hora de selecionar os favoritos
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      );
  }
}
