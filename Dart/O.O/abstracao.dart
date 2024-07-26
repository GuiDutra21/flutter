
// O abstract nao permite a utilizacao da classe personagem na main, vai servir apenas como um escopo para as demais classes
import 'dart:math';

abstract class Personagem 
{
  int? posicaoX;
  int? posicaoY;
  String? nome;
  Personagem({this.nome,this.posicaoX,this.posicaoY});

  void informacao()
  {
    print("O personagem $nome esta nas seguintes posições $posicaoX e $posicaoY");
  }
}

class Heroi extends Personagem
{
  int? bondade;
  Heroi({nome,posicaoX,posicaoY,this.bondade}) : super(nome: nome, posicaoX: posicaoX, posicaoY: posicaoY);

  @override
  void informacao()
  {
    print("O Heroi $nome com bondade $bondade está nas seguintes posições $posicaoX e $posicaoY");
  }
}

class Vilao extends Personagem
{
  int? maldade;
  Vilao({nome,posicaoX, posicaoY, this.maldade}) : super(nome: nome, posicaoX: posicaoX, posicaoY: posicaoY);

  @override
  void informacao()
  {
    print("O Vilão $nome com maldade $maldade está nas seguintes posições $posicaoX e $posicaoY");
  }
}

main()
{
  Heroi heroi1 = Heroi(nome: 'Superman',posicaoX: Random().nextInt(5), posicaoY: Random().nextInt(5), bondade: Random().nextInt(100) + 201);
  heroi1.informacao();

  Vilao vilao1 = Vilao(nome: 'Lex Luthor', posicaoX: Random().nextInt(5), posicaoY: Random().nextInt(5), maldade: Random().nextInt(100) + 201);
  vilao1.informacao();

  if((heroi1.posicaoY ==  vilao1.posicaoY) && (vilao1.posicaoX == heroi1.posicaoX))
  {
    if(vilao1.maldade! > heroi1.bondade!)
    {
      print('${vilao1.nome} lutou com ${heroi1.nome} e ganhou');
    }
    else if(vilao1.maldade! < heroi1.bondade!)
    {
      print('${heroi1.nome} lutou com ${vilao1.nome} e ganhou');
    }
    else
    {
      print('${heroi1.nome} e ${vilao1.nome} lutaram, mas ninguem ganhou');
    }
  }
  else
  {
    print('Nenhum confronto aconteceu');
  }
}