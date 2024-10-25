import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/components/order_widget.dart';
import 'package:store/models/order_list.dart';

// Tela de registro dos pedidos
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  // Apenas para não ficar repetindo o provider varias vezes
  Future<void> loadOrders(BuildContext context) {
    return Provider.of<OrderList>(context, listen: false).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus pedidos"),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder( // Subsitui nesse caso a necessidade de um statefulWidget
          future: loadOrders(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              return const Center(
                child: Text("Ocorreu um erro, tente novemente"),
              );
            } else {
              return Consumer<OrderList>(
                builder: (context, orderList, child) {
                  return RefreshIndicator(
                    onRefresh: () => loadOrders(context),
                    child: orderList.items.isNotEmpty
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
                },
              );
            }
          },
        ));
  }
}
