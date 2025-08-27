import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro_botao.dart';

class Cronometo extends StatelessWidget {
  const Cronometo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text('25:00', style: TextStyle(fontSize: 120, color: Colors.white)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CronometroBotao(icone: Icons.play_arrow, texto: 'Iniciar'),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: CronometroBotao(icone: Icons.stop, texto: 'Parar'),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CronometroBotao(icone: Icons.refresh, texto: 'Reiniciar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
