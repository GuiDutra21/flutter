
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

// Classe que representa a lista de Transactions(retângulos) na tela
// Caso não haja nenhuma transação cadastrada aparece a imagem
class TransactionList extends StatelessWidget {

  // Atributos
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  // Construtor
  const TransactionList(this.transactions, this.onRemove, {super.key});

  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    // Operador ternário que quando for verdadeiro mostra a imagem e quando não mostra as transactions
    return transactions.isEmpty
        ? LayoutBuilder( // Para poder alterar o tamanho de acordo com o tamanho disponivel
          builder: (ctx, constraints)
        {
          return Column(
            children: <Widget>[

              // sizedbox vazio para apenas dar um pequeno espaço
              const SizedBox(
                height: 20,
              ),

              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Nenhuma Transação cadastrada !',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              // ),

              // sizedbox vazio para apenas dar um pequeno espaço
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 55,
                    // height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      // imagem
                      'assets/images/emoji_dormindo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          );
        },
        )

        // Scroll que carrega somente as informações presentes na tela, não mais que isso
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                tr: tr,
                onRemove: onRemove
                );
            },
          );
  }
}
