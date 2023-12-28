import 'package:flutter/material.dart';
import 'questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>
{
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  void _responder(int pontuacao)
  { 
    if(temPerguntaSelecionada)
    {
      setState(()
      {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario()
  {
    setState(()
    {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List <Map<String, Object>> _perguntas = const [
    {
      'texto' : 'Qual é a cor favorita dela ?',
      'resposta' : [
        {'texto' : 'vermelho', 'pontuacao' : 7},
        {'texto' : 'azul', 'pontuacao' : 10},
        {'texto' : 'amarelo', 'pontuacao' : 5},
        {'texto' : 'verde', 'pontuacao' : 3},
        ],
    },
    {
      'texto' : 'Qual o animal favorito dela ?',
      'resposta' : [
        {'texto' : 'cachorro', 'pontuacao' : 10},
        {'texto' : 'gato', 'pontuacao' : 5},
        {'texto' : 'passarinho', 'pontuacao' : 3},
        {'texto' : 'tartaruga', 'pontuacao' : 7},
        ],
    },
    {
      'texto' : 'Qual o dia favorito dela ?',
      'resposta' : [
        {'texto' : 'Segunda', 'pontuacao' : 10},
        {'texto' : 'Terça', 'pontuacao' : 3},
        {'texto' : 'Sábado', 'pontuacao' : 7},
        {'texto' : 'Domingo', 'pontuacao' : 5},
        ],
    }
  ];

  bool get temPerguntaSelecionada//getter para evitar passar do indice da quantidade de perguntas
    {
      return _perguntaSelecionada < _perguntas.length;
    }
  
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Você conhece a Dhayane ?'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
         ? Questionario(
          perguntas: _perguntas,
          perguntaSelecionada:_perguntaSelecionada,
          quandoResponder: _responder,
          )
        : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget 
{  
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState()
  {
    return _PerguntaAppState();
  }
}