import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;

  const EntradaTempo({required this.titulo, required this.valor, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(titulo, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.red,
                iconColor: Colors.white
              ),
              child: Icon(Icons.arrow_downward),
            ),
            Text('$valor min', style: TextStyle(fontSize: 18),),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.red,
                iconColor: Colors.white
              ),
              child: Icon(Icons.arrow_upward),
            ),
          ],
        ),
      ],
    );
  }
}
