import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),

      body: Column(

        children: [
          Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text("Total"),
                    
                    const SizedBox(width: 25), // Apenas para dar um espaço entre o Total e o valor

                    Chip(
                      backgroundColor: Colors.blue[400],
                      label: Text(
                        "R\$${cart.totalAmount}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Define o raio da borda
                        side: const BorderSide(
                          color: Colors.transparent, // Torna a borda invisível
                        ),
                      ),
                    ),

                    // Apenas para fazer o valor se aproximar do Total
                    const Spacer(),

                    TextButton(
                      onPressed: () {},
                      child: const Text("COMPRAR"),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
