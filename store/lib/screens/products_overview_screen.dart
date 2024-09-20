import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/product_grid.dart';

// Classe que representa a tela com todos os produtos
class ProductsOverviewScreen extends StatelessWidget
{
  // Construtor
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text("Loja"),
      ),

      // Chama o componente da matriz dos produtos
      body:  const ProductGrid()
    );
  }

}