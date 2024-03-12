import 'package:flutter/material.dart';

import '../models/product.dart';

// Classe que representa a tela de detalhes de um produto
class ProductDetailScreen extends StatelessWidget
{
  // Construtor
 const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context)
  { 
    // Argumento passado via navegação
    final Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }

}