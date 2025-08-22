import 'package:minesweeper/models/explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({required this.linha, required this.coluna});

  void addVizinho(Campo vizinho) {
    final int deltaLinha = (linha - vizinho.linha).abs();
    final int deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaColuna == 0 && deltaLinha == 0) {
      return;
    }

    if (deltaColuna <= 1 && deltaLinha <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;
    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    for (var v in vizinhos) {
      v.abrir();
    }
  }

  void minar() {
    _minado = true;
  }
  
  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }


  void alterarMarcao() {
    _marcado != _marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get marcado {
    return _marcado;
  }

  bool get aberto {
    return _aberto;
  }

  bool get explodido {
    return _explodido;
  }

  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  bool get vizinhacaSegura {
    return vizinhos.every((v) => !v._minado);
  }

  int get qtdMinnasNaVizinhaca {
    return vizinhos.where((v) => v.minado).length;
  }
}