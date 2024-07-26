// import 'dart:ffi';
import 'dart:math';
// import 'dart:convert';

  int soma(int a, int b)
  {
    return a + b;
  }

  String juntar(dynamic a, b) // O b tambem eh do tipo dinamico
  {
    print(a.toString() + b.toString());
    return a.toString() + b.toString();
  }

  dynamic juntar4( dynamic a, b, c, d)
  {
    return a.toString() + b.toString() + c.toString() + d.toString();
  }

  int numeroAleatorio([int maximo = 10]) //parâmetro opcional
  {
    return Random().nextInt(maximo);
  }

  void dataAleatoria(int dia, [int mes = 2, int ano = 2023])
  {
    print("$dia/$mes/$ano");
  }


main()
{
  int a = 10;
  int b = 15;

  int resultado = soma(a,b);

  print(resultado);
  // Ou entao pode ser chamada direta do print
  print(soma(a, b));

  String resultado1 = juntar(10, 3);

  String resultado2 = juntar('hello ', 'world');

  print(resultado2.toUpperCase());

  print(juntar4("oi ", 20, " C", " Duzir"));

  print(numeroAleatorio(5));

  print(numeroAleatorio(100));

  dataAleatoria(10, 12, 1985);
  dataAleatoria(16, 12);
  dataAleatoria(10);
  
}