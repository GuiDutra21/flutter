
 Object segundoElementoV1(List lista)
  {
    return lista.length >= 2 ? lista[1] : null;
  }

  E? segundoElementoV2<E>(List<E> lista)
  {
    return lista.length >= 2 ? lista[1] : null;
  }


main()
{
  var lista = [14, 7, 18, 5, 8, 5];
  var lista2 = ['jose', 'fernando', 'beth'];

  print(segundoElementoV1(lista));

  int resultado = segundoElementoV2<int>(lista)!;
  print(resultado);

  resultado = segundoElementoV2(lista)!; // Posso omitir ou nao o tipo
  print(resultado);

  print(segundoElementoV1(lista2));

  String resultado2 = segundoElementoV2(lista2)!;
  print(resultado2);

  
}