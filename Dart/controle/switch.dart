
import 'dart:math';

  main()
  {
    var nota = Random().nextInt(11);
    print("A nota sorteada foi $nota");

    switch(nota)
    {
      case 10 :
      case 9:
      print('Quadro de Hora!');
      break;

      case 8 :
      print("Aprovado!");
      break;

      default:
      print('Nota invalida!');
      
    }

    //continue e break

    print("Primeiro for :");
    for(int i = 0; i < 10; i ++)
    {
      if(i == 5)
      break;//sai direto do for sem terminar de executar mais nada
      print(i);
    }

    print("Segundo for : ");

    for(int j = 0; j < 10; j++)
    {
      if(j % 2 == 0)
      continue;
      //quandon o numero for par vai pular direto para o proximo incremento sem passar pelo print, ou seja nao imprimir os numeros pares

      print(j);
    }
  }