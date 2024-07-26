// A função Map eh utilizada para pegar as chaves ou os valores de uma map e realizar alguma operação com eles
// e ela retorna um iterable
main()
{
  List<Map<String, Object>> alunos = [
    {'nome' : 'Alfredo', 'nota' : 9.9},
    {'nome' : 'Bruno', 'nota' : 9.3},
    {'nome' : 'Carlos', 'nota' : 8.7},
    {'nome' : 'Daniel', 'nota' : 8.1},
    {'nome' : 'Eduardo', 'nota' : 7.6},
    {'nome' : 'Francisca', 'nota' : 6.8},
  ]; // nome e nota sao Keys 
    // afredo e 9.9 sao values
 
  String Function(Map) pegarApenasONome = (aluno) => aluno['nome'];
  int Function(String) tamanhoDoNome = (quantidade) => quantidade.length;
  int Function(int) dobro = (numero) => numero * 2;

  print(pegarApenasONome(alunos[0])); // Retorna apenas o nome do Alfredo

  Iterable<String> nomes = alunos.map(pegarApenasONome); // Poderia usar o print direto
  print(nomes);// imprime os nomes do Map

  // Iterable<int>
  var tamanho = nomes.map(tamanhoDoNome); // Poderia usar o print direto
  print(tamanho); // Imprime o tamanho dos nomes do Map
  
  // Iterable<int>
  var tamanhoVezes2 = tamanho.map(dobro); // poderia usar o print direto
  print(tamanhoVezes2); // Multiplica esses valores por 2

  // Outra forma de fazer para pegar apenas o ultimo map(o que dobra os numeros)
  var resultado = alunos.map(pegarApenasONome).map(tamanhoDoNome).map(dobro);
  print(resultado); 
}