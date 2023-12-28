import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

// Classe que representa o quadrado onde contem os gráficos
class Chart extends StatelessWidget {

  // Atributos
  final List<Transaction> recentTransaction; // Lista das últimas transações

  // Construtor
  const Chart(this.recentTransaction, {super.key});

  // Lista de maps que retorna a primeira letra do dia e o valor total do dia 
  List<Map<String, Object>> get groupTransaction
  { 
    // cria uma lista com 7 elementos(os ultimos 7 dias) e vai alocando a letra a cada um e o valor total
    return List.generate(7, (index){ 
      final weekDay = DateTime.now().subtract(
        Duration(days: index), //o index desta linha representa a quantidade de dias que serão subtraídas da data
      );

      double totalSum = 0.0;// soma total

      // Pecorre todas as transações e verifica as transações em seus respectivos dias
      for(var i = 0; i < recentTransaction.length; i++)
      {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear) //verifica se a transação está no mesmo dia
        {
          totalSum += recentTransaction[i].value; // se estiver soma o valor
        }
      } 

      // Retorno da função genterate
      return {
      // Retorna a três primeiras letras do dia, para retorna apenas uma basta acrescentar um [0] no final
        'day': DateFormat.E().format(weekDay),
        'value': totalSum, // soma total do dia
      };
    }).reversed.toList(); // altera a ordem dos elementos para o dia atual aparecer primiero do lado direito
  }

  double get _weekTotalValue// soma total da semana 
  {
    return groupTransaction.fold(0.0, (sum, tr){ // Função fold é igual ao reduce
      return sum + ((tr['value'])as double);
    });
  }
  
  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    return Card( // Chart
      elevation: 6,
      margin: const EdgeInsets.all(20), // margem do Chart
      child: Padding( // envolve os elementos em uma padding
        padding: const EdgeInsets.all(10),
        child: Row( // Linha que representa cada coluna 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransaction.map((tr) // passa para o ChartBar cada dia com os seus respectivos elementos
          {
            return Flexible(
              fit: FlexFit.tight, // concede o mesmo espaço para cada elemento, ajuda a ficar mais organizado
              child: ChartBar(
                label: tr['day'] as String,
                value: tr['value'] as double,
                percentage: _weekTotalValue == 0 ? 0 : ((tr['value']) as double)/_weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}