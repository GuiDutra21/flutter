import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// Classe que representa o Widget retângulo das transactions com o nome, valor, e data
class TransactionItem extends StatelessWidget
{
  // Atributos
  final Transaction tr;
  final void Function(String p1) onRemove;
  
  // Construtor
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  // retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    // Card das Transactions
    return Card(
      elevation: 7,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20
      ),

      // Widget que gera o retângulo da Transaction
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${tr.value}'),
            ),
          ),
        ),

        // Título da transação 
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        // Texto que fica embaixo do nome representando a data da transação
        subtitle: Text(
          DateFormat('d MMM y').format(tr.date),
        ),

        // Ícone de deletar a transação
        trailing : MediaQuery.of(context).size.width > 480 ?
        TextButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text('Excluir',style: TextStyle(fontSize: 18),),
          onPressed: () => onRemove(tr.id),
        )
          : IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.purple,
          onPressed: () => onRemove(tr.id),
        ),
      ),
    );
  }
}