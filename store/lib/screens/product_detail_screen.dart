import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

// Classe que representa a tela de detalhe de um produto
class ProductDetailScreen extends StatelessWidget
{

  // Construtor
  const ProductDetailScreen({ super.key});

  @override
  Widget build(BuildContext context) {

    // Maneira diferente de receber o produto, não precisa passar via construtor
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}