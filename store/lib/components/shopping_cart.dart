import 'package:flutter/material.dart';

// Componente referente ao carrinho no appBar com a quantidade de itens
class ShoppingCart extends StatelessWidget {

  // Atributos
  final Widget child;
  final String value;

  // Construtor
  const ShoppingCart({super.key, required this.child, required this.value});

  @override
  Widget build(BuildContext context) {

    return Padding( // Foi necessário para conseguir espaço entre o ícone e a borda do celular
      padding: const EdgeInsets.only(right: 5),

      child: SizedBox( // Foi necessário para aumentar o tamanho que o ícone e a bolinha estavam ocupando 
          height: 45,
          width: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
          
              child,// Esse atributo que é referente ao ícone do carrinho
          
              Positioned(
                  bottom: 27,
                  right: 1,
          
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    constraints: const BoxConstraints(
                      minHeight: 16,
                      minWidth: 16
                    ),
          
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
          
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
        ),
      ),
    );
  }
}
