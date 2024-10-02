import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

// Classe que representa a tela de detalhe de um produto
class ProductDetailScreen extends StatelessWidget {
  
  // Construtor
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Maneira diferente de receber o produto, não precisa passar via construtor
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),

      body: SingleChildScrollView( // Se necessário deixa a tela rolável
        child: Column(
          children: [

           Padding(
              padding: const EdgeInsets.fromLTRB(17, 25, 17, 10),
              child: ClipRRect( // Aplica a borda arredondada
                borderRadius: BorderRadius.circular(30),
                child: AspectRatio( // Mantém a proporção da imagem
                  aspectRatio: 1 / 1, 
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox( // Apenas para dar espaço entre a imagem e o valor
              height: 10,
            ),

            Text("R\$ ${product.price}", style: const TextStyle(fontSize: 20)), // Preço

            Padding( // Descrição do produto
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Text(
                  product.description,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
