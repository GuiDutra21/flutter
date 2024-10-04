import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/models/product_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  products = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerencias Produtos"),
      ),
      body: Padding(padding: const EdgeInsets.all(10), child: ListView.builder(itemBuilder: (context, index) => Text(products.items[index].name), itemCount: products.itemsLength,),),
      drawer: const AppDrawer(),
    );
  }
}