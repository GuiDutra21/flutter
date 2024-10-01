import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/cart_item.dart';

// Componente referente a cada item dentro do carrinho de compras
// Card com o valor, quantidade e etc
class CartItemWidget extends StatelessWidget {
  // Atributo
  final CartItem cartItem;

  // Construtor
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // Widget que permite a exclusão do item quando arrastamos para o lado
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 22),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Padding(
          padding:
              const EdgeInsets.all(10), // Adiciona um padding ao redor da Row
          child: Row(
            children: [
              CircleAvatar(
                radius: 35, // Aumenta o tamanho do CircleAvatar
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FittedBox(
                    child: Text("R\$${cartItem.price}"),
                  ),
                ),
              ),

              const SizedBox(width: 15), // Espaço entre o círculo e o texto

              Expanded(
                // Permite que o texto ocupe o espaço restante
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinha o texto à esquerda
                  children: [
                    Text(cartItem.name,
                        style: const TextStyle(
                            fontSize: 18)), // Aumenta o tamanho do título
                    const SizedBox(height: 5),
                    Text(
                      // Apenas para arredorndar para 2 casa decimais
                      "Total: R\$ ${double.parse((cartItem.price * cartItem.quantity).toStringAsFixed(2))}",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // "Multiplicador"
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "${cartItem.quantity.toInt()}x",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
