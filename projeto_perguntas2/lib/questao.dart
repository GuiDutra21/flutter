import 'package:flutter/material.dart';

// Classe que representa a pergunta(Texto) das questões
class Questao extends StatelessWidget {

  // Variável
  final String texto;

  // Construtor
  const Questao(this.texto, {super.key});

  // Método que retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,// Faz o container ocupar toda a tela horizontamente
      margin: const EdgeInsets.all(8),// Cria uma margem de 8 pixels entorno de todo o container
      child: Text(
        texto,// Pergunta(Texto) das questões
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
