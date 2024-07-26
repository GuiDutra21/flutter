main()
{
  var alunos = [
    {'nome' : 'Alfredo', 'nota' : 9.9},
    {'nome' : 'Bruno', 'nota' : 9.3},
    {'nome' : 'Carlos', 'nota' : 8.7},
    {'nome' : 'Daniel', 'nota' : 8.1},
    {'nome' : 'Eduardo', 'nota' : 7.6},
    {'nome' : 'Francisca', 'nota' : 6.8},
  ];

  var notasFinais = alunos
  .map((aluno) => aluno['nota']) // pega as notas(que eh do tipo object apriori)
  .map((nota) => (nota as double).roundToDouble()) // converte as notas em double e arredonda
  .where((nota) => nota>= 8.5); // seleciona apenas as que sao maiores que 8.5
  print(notasFinais);

  var total = notasFinais.reduce((t, a) => t + a); // soma as notas arredondadas maiores que 8.5

  print("O valor da média é: ${total / notasFinais.length}.");

}