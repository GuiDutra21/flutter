import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
 
 const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Cart cart = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Card(
          margin: const EdgeInsets.all(25),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total :"),
                SizedBox(width: 15),
                Chip(label: Text("R\$${cart.totalAmount}")),
                Spacer(),
                TextButton(onPressed: () {}, child: Text("Comprar"))
              ],
            ),
          )),
    );
  }
}
