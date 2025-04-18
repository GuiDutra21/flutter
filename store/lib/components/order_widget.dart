import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/order.dart';

// Classe que representa cada CARD da tela orderScreen
class OrderWidget extends StatelessWidget {
  
  // Atributo
  final Order order;

  //Construtor
  const OrderWidget({required this.order, super.key});

  // Apenas para converter o id do produto para um interio a fim de mostrar 'corretamente' o numero do pedido
  int convertProductId(String productId)
  { 
    List<int> ascii = productId.codeUnits;

    return ascii.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        
        // Widget que permite essa animação quando tocamos no botão
        child: ExpansionTile(
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide.none, // Remove a borda quando expandido
            ),
          
          // Hora
          leading: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.blue),
            child: Text(
              DateFormat('dd/MM/yyyy').format(order.date),
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        
          title: FittedBox(child: Text("Número do pedido: ${convertProductId(order.id)}", maxLines: 1,)),
          
          subtitle: Text("Total: R\$ ${order.total.toStringAsFixed(2)}"),
          
          children: order.products.map((product) {
            
            // Itens gerados embaixo quando precionamos o botão
            return Padding(
              padding: const EdgeInsets.fromLTRB(17, 5 ,17 ,5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${product.quantity.toStringAsFixed(0)} x ${product.price}",
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
