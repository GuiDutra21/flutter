class Data 
{
  int? dia;
  int? mes;
  int? ano;

  void dataFormatada()
  {
    print("$dia/$mes/$ano");
  }

  String toString()
  {
    return "Qualquer cosa !!!";
  }

  void retornoQualquer()
  {
    return dataFormatada();
  }
}

void main() 
{
  var DataDeAniversario = new Data(); // o new é opcional
  DataDeAniversario.dia = 16;
  DataDeAniversario.mes = 2;
  DataDeAniversario.ano = 2004;
  print("${DataDeAniversario.dia}/${DataDeAniversario.mes}/${DataDeAniversario.ano}");

  Data diaAtual = Data();
  diaAtual.dia = 23;
  diaAtual.mes = 2;
  diaAtual.ano = 2023;
  print("${diaAtual.dia}/${diaAtual.mes}/${diaAtual.ano}");

  diaAtual.dataFormatada(); // outra maneira de fazer 
  print(diaAtual); // a classe naturalmente retorna o método toString()

  diaAtual.retornoQualquer();
}