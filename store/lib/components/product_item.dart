import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/exceptions/http_exception.dart';
import 'package:store/models/product.dart';
import 'package:store/models/product_list.dart';

import '../utils/app_routes.dart';

// Componente que representa cada produto na tela de gerenciar produtos
class ProductItem extends StatelessWidget {
  // Atributo
  final Product product;

  // Construtor
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width:
            100, // Sem esse widget dá erro, pois a row vai tentar ocupar todo o espaço disponível e o ListTitle não define um tamanho, assim a Row meio que tem tamanho infinito
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.productsForm, arguments: product);
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
                onPressed: () {
                  showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Excluir produto"),
                            content: const Text("Tem Certeza ?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(
                                        false); // Para fechar o AlertDialog e retorna false
                                  },
                                  child: const Text("Não")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(
                                        true); // Para fechar o AlertDialog e retorna true
                                  },
                                  child: const Text("Sim")),
                            ],
                          )).then((value) async {
                    if (value ?? false) {
                      try {
                        await Provider.of<ProductList>(context, listen: false)
                            .removeProduct(product);
                      } on HttpException catch (error) // esse 'on HttpException' captura apenas exceção do tipo HttpException
                      {
                        scaffoldMessenger.showSnackBar(
                          SnackBar(content: Text(error.toString()))
                        );
                      }
                    }
                  });
                },
                icon: const Icon(Icons.delete),
                color: Colors.red[600])
          ],
        ),
      ),
    );
  }
}
