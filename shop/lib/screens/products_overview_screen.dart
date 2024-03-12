import 'package:flutter/material.dart';
import '../components/product_grid.dart';

// Classe que representa a tela pricinpal
class ProductsOverviewScreen extends StatelessWidget {

  // Contrutor
  const ProductsOverviewScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha loja", style: TextStyle(color: Colors.black),),
      ),
      body: const ProductGrid(), // Componente referente ao layout em matriz
    );
  }
}
