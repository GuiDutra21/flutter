import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Classe que representa o Widget retângulo das transactions com o nome, valor, e data
class TransactionItem extends StatelessWidget {
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
    // return Card(
    //             elevation: 5,
    //             margin: const EdgeInsets.symmetric(
    //               vertical: 8,
    //               horizontal: 5,
    //             ),
    //             child: ListTile(
    //                 leading: CircleAvatar(
    //                   backgroundColor: Colors.purple,
    //                   radius: 30,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(6),
    //                     child: FittedBox(
    //                       child: Text(
    //                         'R\$${tr.value}',
    //                         style: const TextStyle(
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 title: Text(
    //                   tr.title,
    //                   style: Theme.of(context).textTheme.headline6,
    //                 ),
    //                 subtitle: Text(
    //                   DateFormat('d MMM y').format(tr.date),
    //                 ),
    //                 trailing: MediaQuery.of(context).size.width > 480
    //                     ? TextButton.icon(
    //                         onPressed: () => onRemove(tr.id),
    //                         icon: Icon(Icons.delete,
    //                             color: Theme.of(context).errorColor),
    //                         label: Text(
    //                           'Excluir',
    //                           style: TextStyle(
    //                               color: Theme.of(context).errorColor),
    //                         ),
    //                       )
    //                     : IconButton(
    //                         icon: const Icon(Icons.delete),
    //                         color: Theme.of(context).errorColor,
    //                         onPressed: () => onRemove(tr.id),
    //                       )),
    //           );

    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Card(
        elevation: 15,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              height: 90,
              width: 90,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                          'R\$${tr.value}',
                          style: const TextStyle(color: Colors.white, fontSize: 25),
                        ),
                    ),
                  ),
                ],
              ),
            ),

            //  Título da transação
             Flexible(
               child: Column(children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                              tr.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 35),
                          ),
                      ),
                    ),
               
                  // Texto que fica embaixo do nome representando a data da transação
                  Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: const TextStyle(fontSize: 17),
                  ),
                ]),
             ),

            // Ícone de deletar a transação
            MediaQuery.of(context).size.width > 480
                ? TextButton.icon(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Excluir',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    onPressed: () => onRemove(tr.id),
                  )
                : IconButton(
                    icon: const Icon(Icons.delete),
                    iconSize: 35,
                    color: Colors.red,
                    onPressed: () => onRemove(tr.id),
                  ),
        ]),
        ),
    ));
  }
}
