
// Função genérica que faz um filtro da lista do parâmetro
// Dessa forma cria uma nova lista somente com os elementos que atendem a função passada nos parâmetros
// Como é genérica funciona com qualuqer tipo de dado
List<E> filtrar<E>(List<E> lista, bool Function(E) fn)
{
  List<E> listaFiltrada = [];
  for(E elemento in lista)
  {
    if(fn(elemento))// se for verdadeiro adiciona
      listaFiltrada.add(elemento);
  }
  return listaFiltrada;
}

main()
{
  List<double> notas = [8.9, 5.7, 7.7, 5.4, 4.5, 9.3, 6.2, 8.3];

  bool Function(double) notasBoasFn = (double nota) => nota >= 7.5;

  var notasBoas = filtrar<double>(notas, notasBoasFn);
  print(notasBoas);

  List<String> nomes = ['Ana', 'Marcelo', 'Joao', 'kamila', 'Guilherme'];
  bool Function(String) nomesGrandesFn = (String nome) => nome.length >= 5;

  print(filtrar(nomes, nomesGrandesFn));

}