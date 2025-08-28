import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro_botao.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometo extends StatelessWidget {
  const Cronometo({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) {
        final color = store.estaTrabalhando() ? Colors.red : Colors.green;
        return Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                store.estaTrabalhando()
                    ? 'Hora de Trabalhar'
                    : 'Hora de Descansar',
                style: TextStyle(fontSize: 40, color: Colors.white,),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (store.minutos > 0) {
                        store.minutos--;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      iconColor: color,
                      padding: EdgeInsets.all(0),
                    ),
                    child: const Icon(Icons.remove, size: 35),
                  ),
                  AutoSizeText(
                    '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                    maxFontSize: 105,
                    minFontSize: 90,
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () => store.minutos++,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      iconColor: color,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Icon(Icons.add, size: 35),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.iniciado)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CronometroBotao(
                        icone: Icons.play_arrow,
                        texto: 'Iniciar',
                        click: store.iniciar,
                      ),
                    ),
                  if (store.iniciado)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CronometroBotao(
                        icone: Icons.stop,
                        texto: 'Parar',
                        click: store.parar,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CronometroBotao(
                      icone: Icons.refresh,
                      texto: 'Reiniciar',
                      click: store.reiniciar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
