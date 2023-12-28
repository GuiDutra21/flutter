import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget
{ 
  //Os atributos da classe
  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada; //índice da pergunta selecionada
  // Função que representa o que deve ser feito quando uma pergunta for respondida
  final void Function(int) quandoResponder; 

  // Construtor
  const Questionario({
    // o Required obriga que passemos o repectivo elemento na hora de chamar o constutor
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key}
    );

  //Função que verifica se tem alguma pergunta que ainda não foi selecioanda
  bool get temPerguntaSelecionada
  {
    return perguntaSelecionada < perguntas.length;
  }

  //Método build que irá retorna todos os widgets presentes (retorna a árvore de Widgets)
  @override
  Widget build(BuildContext context)
  { 
    //Variável que caso haja alguma pergunta que ainda não foi selecioanda recebe a lista de Maps
    // que contem as opções e as suas respectivas pontuações daquela pergunta presente na tela
    List<Map<String, Object>> respostas = temPerguntaSelecionada 
      ? perguntas[perguntaSelecionada]['resposta'] as List<Map<String, Object>>
      : [];

    // Widget que retorna as opções da pergunta e o texto da pergunta em si
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),// A pergunta(texto) das questões

        // Esses potinhos(...) 'spread operator' seleciona cada elemento da lista de respostas
        // e após a manipulação que foi feita nas linhas (44 - 47) adiciona cada widget na column
        ...respostas
        // Map que captura cada elemento de respostas e os utiliza para chamar os Widsgets Resposta
        .map((resp) => Resposta(
          resp['texto']as String,
          () => quandoResponder(int.parse(resp['pontuacao'].toString())))
        ).toList(),//map
        // O toList() é necessário porque o retorno do map é um itarable,
        // logo precisamos converter para uma lista, pois somente assim poderá ser adiconado na column
      ],
    );
  }
}