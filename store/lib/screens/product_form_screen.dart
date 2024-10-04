import 'package:flutter/material.dart';

// Tela de formulário quando desejamos criar um novo produto
class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário do Produto"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Nome"),
              textInputAction: TextInputAction.next, // Para quando clicar no enter ir para o próximo formulário(mas sozinho não faz isso)
              
            )
          ],
        )),
      ),
    );
  }
}