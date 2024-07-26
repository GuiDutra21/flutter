class Carro 
{
  // Atributo
  int? marca;

  // Construtor
  Carro({this.marca});

  // Metodo
  void acelerar()
  {
    print('O carro esta acelerando');
  }
}

class CarroEletrico extends Carro
{
  // Atributo
  int? bateria;

  // Construtor
  CarroEletrico({this.bateria, marca}) : super(marca: marca);

  // O polimorfismo esta presente logo abaixo, quando herdamos algo e alteramos
  @override
  void acelerar()
  {
    super.acelerar();
    print('A bateria esta sendo usada');
  }
}

main()
{
  Carro carro_eletrico = CarroEletrico(bateria: 100,marca: 20);
  carro_eletrico.acelerar();
}