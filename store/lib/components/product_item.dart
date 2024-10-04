import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

// Componente que representa cada produto na tela de gerenciar produtos
class ProductItem extends StatelessWidget {
  // Atributo
  final Product product;

  // Construtor
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100, // Sem esse widget dá erro, pois a row vai tentar ocupar todo o espaço disponível e o ListTitle não define um tamanho, assim a Row meio que tem tamanho infinito
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red[600]
            )
          ],
        ),
      ),
    );
  }
}
