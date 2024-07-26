
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
  }