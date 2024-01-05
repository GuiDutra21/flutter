import 'package:flutter/material.dart';

class Resultado extends StatelessWidget
{ 
  final void Function() reinciar;
  final int pontuacao;
  const Resultado(this.pontuacao, this.reinciar, {super.key});

  String get fraseFinal
  {
    if(pontuacao < 12)
    {
      return 'Sabe pouco !!';
    }
    else if( pontuacao < 17)
    {
      return 'Você sabe muito à respeito dela!';
    }
    else if (pontuacao < 25)
    {
      return 'Nivel Emily e Malu';
    }
    else
    {
      return 'Você é a Dhayane?';
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseFinal,
            style: const TextStyle(fontSize: 26),
          ),
        ),
        TextButton(
          onPressed: reinciar,
          child: const Text(
            'Reiniciar ?',
            style: TextStyle(
            fontSize: 18
            ) 
          ),
        )
      ],
    );
  }
}