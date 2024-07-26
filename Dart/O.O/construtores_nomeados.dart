class Data 
{
  int? dia;
  int? mes;
  int? ano;

  Data(this.dia, this.mes, this.ano);

  Data.com({this.dia = 12, this.mes = 02, this.ano}); // Exemplo de contrutor nomeado

  Data.ultimoDiaDoAno(this.ano) // Exemplo de construtor nomeado
  {
    dia = 31;
    mes = 12;
  }

  //@override
  String toString()
  {
    return "$dia/$mes/$ano";
  }
}

main()
{
  Data aniversario = new Data(5,5,2000); // O new é opcional
  print(aniversario);//Printa o toString()

  Data dataFinal = Data.com(ano: 1970,mes: 12);
  print(dataFinal); // Printa o toString()

  print("O ultimo dia do ano eh : ${Data.ultimoDiaDoAno(2074)}");
}