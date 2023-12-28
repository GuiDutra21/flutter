import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto' : 'Azul', 'pontuacao' : 7 },
        {'texto' : 'Verde', 'pontuacao' : 5 },
        {'texto' : 'Vermelho', 'pontuacao' : 10 },
        {'texto' : 'Rosa', 'pontuacao' : 3 },
       ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta': [
        { 'texto' : 'Gato', 'pontuacao' : 3 },
        { 'texto' : 'Cachorro', 'pontuacao' : 10 },
        { 'texto' : 'Coelho', 'pontuacao' : 5 },
        { 'texto' : 'Tartaruga', 'pontuacao' : 7},
      ],
    },
    {
      'texto': 'Qual o seu dia favorito ? ',
      'resposta': [
        {'texto' : 'Segunda', 'pontuacao' : 5 },
        {'texto' : 'Sexta', 'pontuacao' : 7 },
        {'texto' : 'Sabado', 'pontuacao' : 10 },
        {'texto' : 'Domingo', 'pontuacao' : 5 },
      ],
    },
  ];

  // Função responsável por sormar a pontuação
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  // Função que reiciar o questionário
  void _reiniciarQuestionario()
  { 
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  // Função responsável por verificar se ainda existem perguntas a seres respondidas
  bool get temPerguntaSelecionada
  {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,//Remove a fitinha vermelha no canto superior direito escrito "Demo"
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Questionario'),//Titulo do appBar
        centerTitle: true,//Centraliza o nome presente no appBar
      ),
      //O Body representa o que estará presente no aplicativo fora do appBar 
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder
              )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario), // Quando temrina o questionário chama esse Widget
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
