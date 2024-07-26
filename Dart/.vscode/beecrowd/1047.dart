import 'dart:io';
import 'dart:convert';

  main()
  { 
    var dados = stdin.readLineSync().toString();//recebe todos os dados em um string
    List valoresSeparados = dados.split(" ");//sepra a string em uma lista retirando o espaços
    print(valoresSeparados);

    int Hinicial2 = int.tryParse(valoresSeparados[0]) ?? 0;//transforma em inteiro ou em 0 caso nao consiga converter
    int Minicial2 = int.tryParse(valoresSeparados[1]) ?? 0;
    int Hfinal2 = int.tryParse(valoresSeparados[2]) ?? 0;
    int Mfinal2 = int.tryParse(valoresSeparados[3]) ?? 0;

    int horas = 0, minutos = 0;

    if(Hfinal2 > Hinicial2)//hora final maior que a inicial
    {
      if(Mfinal2 >  Minicial2)// minuto final maior que o inicial
      {
        horas = Hfinal2 - Hinicial2;
        minutos = Mfinal2 - Minicial2;
      }
      else if (Mfinal2 < Minicial2)// minuto inicial maior que final
      {
        horas = Hfinal2 - Hinicial2 - 1;
        minutos = 60 - (Minicial2 - Mfinal2);
      }
      else//minutos iguais
      {
        horas = Hfinal2 - Hinicial2;
      }
    }
    else if (Hfinal2 < Hinicial2)//hora inicial maior que a final
    {
      if (Mfinal2 > Minicial2)//minuto final maior que o inicial
      {
        horas = 24 - (Hinicial2 - Hfinal2);
        minutos = Mfinal2 - Minicial2;
      }
      else if(Mfinal2 < Minicial2)//minuto inicial maior que o final 
      {
        horas = 23 - (Hinicial2 - Hfinal2);
        minutos = 60 - (Minicial2 - Mfinal2);
      }
      else//minutos iguais
      {
        horas = 24 - (Hinicial2 - Hfinal2);
      }
    }
    else //horas iguais
    {
      if(Mfinal2 > Minicial2)//minuto final maior que o inicial
      {
        minutos = Mfinal2 - Minicial2;
      }
      else if (Mfinal2 < Minicial2)//minuto final menor que o inicial
      {
        horas = 23;
        minutos = 60 - (Minicial2 - Mfinal2);
      }
      else//minutos iguas
      {
        horas = 24;
      }
    }
    
    print("O JOGO DUROU $horas HORA(S) E $minutos MINUTO(S)");

  }