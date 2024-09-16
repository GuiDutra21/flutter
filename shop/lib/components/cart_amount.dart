import 'package:flutter/material.dart';

// Classe que representa o ícone do carrinho e o seu contador
class CartAmount extends StatelessWidget {
  // Atributos
  final Widget child;
  final String value;
  final Color? color;

  // Construtor
  const CartAmount(
      {super.key, required this.child, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        child, // Esse atributo que é ferente ao ícone do carrinho

        Positioned(
          right: 4,
          top: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).focusColor,
            ),
            constraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            child: Text(
              value,
              style: const TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10)
        //   ),
        // )
      ],
    );
  }
}
