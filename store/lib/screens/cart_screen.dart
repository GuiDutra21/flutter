import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/cart_item_widget.dart';
import 'package:store/models/order_list.dart';

import '../models/cart.dart';

// Tela de detalhe das compras, quando clicamos no ícone do carrinho de compras
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Providers
    var cart = Provider.of<Cart>(context);
    var items = cart.items.values.toList(); // lista de items do carrinho

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.fromLTRB(15, 25, 15, 20),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total", style: TextStyle(fontSize: 18),),

                  const SizedBox(
                      width:
                          16), // Apenas para dar um espaço entre o Total e o valor

                  Chip(
                    backgroundColor: Colors.blue[400],
                    label: Text( 
                      "R\$ ${cart.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      
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

                  BuyButton(cart: cart),
                ],
              ),
            ),
          ),
          // Quando você coloca um ListView dentro de uma Column, o ListView tenta ocupar o máximo de espaço possível, mas a Column é um widget de layout que organiza seus filhos verticalmente com base no espaço disponível. Se um dos filhos, como o ListView, não tiver um limite de altura definido, ele pode causar um erro de layout, porque o Flutter não saberá quanta altura deve ser atribuída ao ListView dentro da Column.
          // O widget Expanded indica ao Flutter que o ListView deve ocupar o espaço restante disponível dentro da Column, após outros widgets terem recebido o espaço necessário (seja tamanho fixo ou flexível). Isso resolve o erro de layout, porque o Flutter passa a saber como distribuir o espaço corretamente.
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) =>
                      CartItemWidget(cartItem: items[index]))),
        ],
      ),
    );
  }
}

// Classe que representa o botao de comprar no canto superioir direito
class BuyButton extends StatefulWidget {

  // Atributo
  final Cart cart;

  // Construtor
  const BuyButton({
    super.key,
    required this.cart,
  });

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {

  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return isLoading ? const CircularProgressIndicator() : TextButton(
      onPressed: widget.cart.items.isEmpty ? null :  () async {
        setState(() => isLoading = true);
        await Provider.of<OrderList>(context, listen: false).addOrder(widget.cart);
        setState(() => isLoading = false);
        widget.cart.clear();
      },
      child: const Text("COMPRAR", style: TextStyle(fontSize: 15),),
    );
  }
}
