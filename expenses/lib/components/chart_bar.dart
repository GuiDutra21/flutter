import 'package:flutter/material.dart';

// Classe que representa o retângulo todinho do gráfico
class ChartBar extends StatelessWidget {

  // Atributos
  final double value, percentage;
  final String label;

  // Contrutor
  const ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
    super.key,
  });

  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx,constraints)
      {
        return Column(
        children: <Widget>[

          // valor total do dia que aparece encima
          SizedBox(
            height: constraints.maxHeight * 0.15,
            // o FittedBox ajusta o manho da fonte para caber exatamente no tamanho disponível
              child: FittedBox(
                child: Text(value.toStringAsFixed(2)),
            )
          ), 

          SizedBox(
            // sizedbox vazio para apenas dar um pequeno espaço
            height: constraints.maxHeight * 0.05,
          ),

          SizedBox(
            // barra que representa a porcentagem
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              // Widget que permite colocarmos coisas encima de outras
              alignment: Alignment
                  .bottomCenter, // aliamento para que a barra roxa suba partindo da parte inferior
              children: <Widget>[
                Container(
                  // parte de fora da barra
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: const Color.fromRGBO(220, 220, 220, 1.0),
                      borderRadius: BorderRadius.circular(5)),
                ),
                
                // Widget  que permite dimensionar um filho
                // dentro de um contêiner pai de acordo com frações específicas do tamanho do contêiner pai.
                FractionallySizedBox( 
                  heightFactor: percentage, // valor que a barra vai assumir
                  child: Container( // parte de dentro da barra
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            ),
          ),

          // sizedbox vazio para apenas dar um pequeno espaço
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),

          SizedBox(
            height: constraints.maxHeight * 0.15,
            // o FittedBox ajusta o manho da fonte para caber exatamente no tamanho disponível
            child: FittedBox (
              // Três letras correspondente ao dia da semana
              child: Text(label)),
            ),
        ],
      );
      }
    );
  }
}