import 'package:flutter/material.dart';
import 'package:store/components/product_item.dart';
import 'package:store/data/dummy_data.dart';
import 'package:store/models/product.dart';

class ProductsOverviewScreen extends StatelessWidget
{
  final List<Product> productList = dummyProducts;
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Loja"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductItem(product: productList[index]),
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        
        ),
        ),
    );
  }

}