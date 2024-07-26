class Data 
{ 
  // Atributos
  int? dia;
  int? mes;
  int? ano;

  //  Apenas um construtor eh permitido com o mesmo nome
  //  Data(int? diaRecebido, int? mesRecebido, int? anoRecebido)
  //  {
  //  dia = diaRecebido;
  //  mes = mesRecebido;
  //  ano = anoRecebido;
  //  }

  // Data( int dia, int mes, int ano)
  // {
  //   this.dia = dia;
  //   this.mes = mes;
  //   this.ano = ano;
  // }

  // Construtor
  Data(this.dia, this.mes, this.ano);

  // Metodo
  @override
  String toString()
  {
    return "$dia/$mes/$ano";
  }
}

main()
{
  Data aniversario = Data(5,5,2000);
  // aniversario.dia = 5;
  // aniversario.mes = 5;
  // aniversario.ano = 2000;

  print(aniversario);


}