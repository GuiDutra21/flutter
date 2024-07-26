import '../modelo/carro.dart';


main()
{
  var carro = Carro(300);

  while((carro.estaNoLimite() == false))
  {
    print('A velocidade atual do carro eh : ${carro.acelerar()} Km/h \n');
  } 

  print("A velocida Maxima do carro foi atingida !!! ${carro.velocidadeMaxima} Km/h \n");

  while(!carro.estaParado())
  {
    print('A velocidade atual do carro eh : ${carro.freiar()} \n');
  }

  carro.velocidadeAtual = 500; // O método set nao permite
  carro.velocidadeAtual = 3; // já para esse valor o método set permite
  print("O carro parou !!! com a seguinte velocidade : ${carro.velocidadeAtual}");
  
}