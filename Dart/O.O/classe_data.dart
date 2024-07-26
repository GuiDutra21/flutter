class Data 
{ 
  // Atributos
  int? dia;
  int? mes;
  int? ano;

  // Metodo
  void dataFormatada()
  {
    print("$dia/$mes/$ano");
  }

  // Metodo
  @override
  String toString()
  {
    return "Qualquer cosa !!!";
  }

  // Metodo
  void retornoQualquer()
  {
    return dataFormatada();
  }
}

void main() 
{
  // Objeto
  var DataDeAniversario = new Data(); // O new é opcional

  DataDeAniversario.dia = 16;
  DataDeAniversario.mes = 2;
  DataDeAniversario.ano = 2004;
  print("${DataDeAniversario.dia}/${DataDeAniversario.mes}/${DataDeAniversario.ano}");

  // Objeto
  Data diaAtual = Data();
  diaAtual.dia = 23;
  diaAtual.mes = 2;
  diaAtual.ano = 2023;
  print("${diaAtual.dia}/${diaAtual.mes}/${diaAtual.ano}");

  diaAtual.dataFormatada(); // Outra maneira de fazer 
  print(diaAtual); // A classe naturalmente retorna o método toString()

  diaAtual.retornoQualquer();
}