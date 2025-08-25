import 'package:flutter/material.dart';
import 'package:minesweeper/components/resultado_widget.dart';
import 'package:minesweeper/components/tabuleiro_widget.dart';
import 'package:minesweeper/models/campo.dart';
import 'package:minesweeper/models/explosao_exception.dart';
import 'package:minesweeper/models/tabuleiro.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro? _tabuleiro;

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdColunas = 15;
      double tamanhoCampo = largura / qtdColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: qtdLinhas,
        colunas: qtdColunas,
        qtdBombas: 10,
      );
    }

    return _tabuleiro!;
  }

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro!.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro!.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        campo.alterarMarcao();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: ResultadoWidget(venceu: _venceu, onReiniciar: _reiniciar),
        body: SafeArea(
          child: SizedBox(
            child: LayoutBuilder(builder: (context, constraints) {
              return TabuleiroWidget(
              tabuleiro: _getTabuleiro(constraints.maxWidth, constraints.maxHeight),
              onAbrir: _abrir,
              onAlternarMarcacao: _alternarMarcacao,);
            })
            ),
        ),
        ),
      );
  }
}
