import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo({required this.titulo, required this.valor, this.inc, this.dec, super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(titulo, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10,),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dec,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
                  iconColor: Colors.white
                ),
                child: Icon(Icons.arrow_downward),
              ),
              Text('$valor min', style: TextStyle(fontSize: 18),),
              ElevatedButton(
                onPressed: inc,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
                  iconColor: Colors.white
                ),
                child: Icon(Icons.arrow_upward),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
