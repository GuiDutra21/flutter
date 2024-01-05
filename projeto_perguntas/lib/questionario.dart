import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget
{ 
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.quandoResponder,
    super.key,
    }); 

    bool get temPerguntaSelecionada // getter para evitar passar do indice da quantidade de perguntas
    {
      return perguntaSelecionada < perguntas.length;
    }

  @override
  Widget build(BuildContext context)
  {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? 
    perguntas[perguntaSelecionada]['resposta'] as List<Map<String, Object>>
    : [];

    return Column(
      children: <Widget> 
      [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
          ...respostas.map((resp)
          {
          return Resposta(
            resp['texto'] as String,
          () => quandoResponder(resp['pontuacao'] as int)
          );
          }).toList(),
      ],
    );
  }
}