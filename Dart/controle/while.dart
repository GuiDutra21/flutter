import 'dart:io';

  main()
  {
    var digitado = "";

    while(digitado != 'sair')
    {
      stdout.write('Digite algo ou sair ');
      digitado = stdin.readLineSync().toString();   
    }
    
    digitado = '';

    do {
      stdout.write('Digite algo ou sair ');
      digitado = stdin.readLineSync().toString();
    } while (digitado != 'sair');
  }