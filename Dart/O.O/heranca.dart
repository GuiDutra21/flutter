main ()
{
  Pessoa pessoa1 = Pessoa(idade: 19, nome: 'Guilherme');
  pessoa1.apresenta();

  Pai pai1 = Pai(idade: 35, nome: 'Joao');
  pai1.apresenta();

  Pai2 pai2 = Pai2(nome: 'Fernando', idade: 33, profissao: 'piloto');
  pai2.apresenta();

  Filho filho1 = Filho(nome: 'Sebastian', idade: 12, escola: 'Centrao');
  filho1.apresenta();
}

class Pessoa
{ 
  // Atributos
  String? nome;
  int? idade;

  // Construtor
  Pessoa({this.idade,this.nome});

  // Metodo
  void apresenta()
  {
    print('Meu nome eh $nome e a minha idade eh $idade anos');
  }
}

class Pai extends Pessoa 
{ 
  // Atributo
  String? profissao;

  // Construtor
  Pai({idade,nome}) : super(idade: idade ,nome: nome);
}

class Pai2 extends Pessoa 
{
  // Atributo
  String? profissao;

  // Construtor
  Pai2({idade,nome,this.profissao}) : super(idade: idade ,nome: nome);

  // Metodo
  @override
  void apresenta()
  {
    print('Meu nome eh $nome, a minha idade eh $idade anos e a minha profissao eh $profissao');
  }
}

class Filho extends Pessoa
{ 
  // Atributo
  String? escola;

  // Construtor
  Filho({idade, nome, this.escola}) : super(idade: idade, nome: nome);
  
  // Metodo
  @override
  void apresenta()
  {
    print('Meu nome eh $nome, a minha idade eh $idade anos e estudo na escola $escola');
  }
}