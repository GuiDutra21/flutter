import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometo.dart';
import 'package:pomodoro/components/entrada_tempo.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Cronometo()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(titulo: 'Trabalho', valor: 22),
                EntradaTempo(titulo: 'Descanso', valor: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
