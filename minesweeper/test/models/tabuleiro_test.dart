import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/tabuleiro.dart';

main() {
  
  test('Ganhar Jogo', () {
    Tabuleiro tabuleiro = Tabuleiro(linhas: 2, colunas: 2, qtdBombas: 0);

    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    // Jogando...
    tabuleiro.campos[0].alterarMarcao();
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[2].abrir();
    tabuleiro.campos[3].alterarMarcao();

    expect(tabuleiro.resolvido, isTrue);
  });
}
