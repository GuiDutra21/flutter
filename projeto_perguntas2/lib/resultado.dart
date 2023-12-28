import 'package:flutter/material.dart';

// Classe que representa o resultado do quiz
class Resultado extends StatelessWidget
{
  // Atributos
  final int pontuacao;
  final void Function() reiniciar;

  // Construtor
  const Resultado(this.pontuacao, this.reiniciar, {super.key});

  // Método get que retorna uma mensagem de acordo com a sua pontuação
  String get mensagemFinal
  {
    if(pontuacao < 12)
    {
      return 'Tente de novo :(';
    }
    else if (pontuacao < 16)
    {
      return 'Parabens !';
    }
    else if (pontuacao < 22)
    {
      return 'Voce arrasou !!';
    }
    else
    {
      return 'Nivel Jedi !!!';
    }
  }
  
  // Método que retorna a árvore de Widgets
  @override
  Widget build(BuildContext context)
  { 
    // Coluna com a mensagem final e com o botão de reiniciar
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,// Centraliza verticalemnte no centro
      children : <Widget>[
      Center(
        child : Text(
        mensagemFinal,
        style : const TextStyle(fontSize: 28),
        )
       ),
       TextButton(
        onPressed: reiniciar,
        child: const Text(
          'Reiniciar ?',
          style: TextStyle(fontSize: 18),
        )
       )
      ]
    ); 
  }
}