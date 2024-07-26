// Essa funcoes mostram como funciona internamente a funcao 'reduce'
// Existe um acumulador e o elemento que sera iterado
double somar (double acumulador, double elemento)
{
  return acumulador + elemento;
}

String concatenacao (String a1, String a2)
{ 
  return "$a1, $a2";
}

main()
{
  var notas = [7.3 ,5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
  var resultado = notas.reduce(somar);
  print(resultado);

  var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Edna', 'Fatima'];
  var cat = nomes.reduce(concatenacao);
  print(cat);
}