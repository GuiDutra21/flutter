import '../modelo/carro.dart';


main()
{
  var teste = Carro(300);

  while((teste.estaNoLimite() == false))
  {
    print('A velocidade atual do carro eh : ${teste.acelerar()} Km/h \n');
  } 

  print("A velocida Maxima do carro foi atingida !!! ${teste.velocidadeMaxima} Km/h \n");

  while(!teste.estaParado())
  {
    print('A velocidade atual do carro eh : ${teste.freiar()} \n');
  }

  teste.velocidadeAtual = 500;// O método set nao permite
  teste.velocidadeAtual = 3;// já para esse valor o método set permite
  print("O carro parou !!! com a seguinte velocidade : ${teste.velocidadeAtual}");
  
}