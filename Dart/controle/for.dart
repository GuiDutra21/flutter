// import 'dart:ffi';
import 'dart:math';

main()
{
  var nota = Random().nextInt(11);
  int a;

  print(" O valor da nota foi $nota ");

  if(nota >= 5)
  {
      print(" aprovado!!");
  }
  else
  {
      print(' reprovado!');
  }

  for( a = 0; a < 10; a++)
  {
      print(a);
  }

  print("fora do for o a vale $a");

  var notas = [8.9, 9.3, 7.8, 6.9, 9.1];

  for( int i = 0; i < notas.length; i++)
  {
      print("Notas ${i + 1} = ${notas[i]}.");
  }

  print("\n");

  for( double nota in notas )
  {
      print("O valor da nota eh $nota.");
  }

  var cordenadas = [
    [1,3],
    [9,1],
    [19,23],
    [2,14],
  ];

  for(var cordenada in cordenadas)
  {
    for( var ponto in cordenada)
    {
      print("ponto : $ponto");
    }
  }
  
  int h,b;
  for(h = 0; h < cordenadas.length; h++)
  {
    var dupla = cordenadas[h];

    for(b = 0; b < dupla.length; b++)
    {
      var pontos = dupla[b];
      print("pontos com o for tradicional : $pontos");
    }
  }

  Map<String,double> Notas = 
  {
    'Pedro' : 9.2,
    'Matheus' : 9.0,
    'Tiago' : 8.0,
    'Marcos' : 7.9,
    'Joao' : 8.9,
  };   

  for(String nome in Notas.keys) // Somente as chaves
  {
    print("O nome do auluno eh : $nome");
  }

  for(double valores in Notas.values) // Somente os valores
  {
    print("Os valores sao : $valores");
  }

  for(String name in Notas.keys) // Printa os dois
  {
    print("O nome do aluno eh : $name e a nota eh : ${Notas[name]}"); 
  }

  for(var registro in Notas.entries) // Outra maneira de printar as chaves e os valores do Map
  {
    print("O ${registro.key} tem nota ${registro.value} ");
  }

   // Continue e break

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
      // Quando o numero for par vai pular direto para o proximo incremento sem passar pelo print, ou seja nao imprimir os numeros pares

      print(j);
    }
}