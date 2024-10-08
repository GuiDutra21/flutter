import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/components/order_widget.dart';
import 'package:store/models/order_list.dart';

// Tela de registro dos pedidos
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderList>(
        context); // Provider para obter a lista de pedidos
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus pedidos"),
      ),
      drawer: const AppDrawer(),
      body: orderList.items.isNotEmpty
          ? ListView.builder(
              itemCount: orderList.items.length,
              itemBuilder: (context, index) =>
                  OrderWidget(order: orderList.items[index]))

          // Se a lista de pedidos estiver vazia mostra a mensagem debaixo
          : const Center(
              child: Text(
              "Nenhuma compra foi realizada ainda !",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            )),
    );
  }
}
