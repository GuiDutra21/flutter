import 'package:flutter/material.dart';

// Classe que representa as opções de cada resposta
class Resposta extends StatelessWidget
{ 
  // Atributos
  final String texto;
  final void Function() quandoSelecionado;

  // Construtor
  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  // Método que retorna a árvore de Widgets
  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: double.infinity, //Ocupa todo o tamanho horizontal
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      onPressed: quandoSelecionado, //Função que o botão executa
      child: Text(texto), // Texto presente no botão
      )
    );
 
  }
}