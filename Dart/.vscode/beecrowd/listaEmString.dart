import 'dart:io';

main()
{
  String teste = stdin.readLineSync().toString();
  List teste2 = teste.split("");// transforma a String em lista
  print(teste2);
  teste2[0] = "W";
  print(teste2.length);
  String teste3 = teste2.join("");//transforma a lista em String
  print(teste3);
}