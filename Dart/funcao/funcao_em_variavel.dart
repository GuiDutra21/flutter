// import 'dart:io';

saudarPessoa({String? nome, int? idade}) // Parametros nomeados
{
  print("Ola $nome, vc nao parece ter $idade anos.");
}

int somaFn(int a, int b)
{
  return a + b;
}

main()
{
  saudarPessoa(nome:"Joao",idade: 33);
  saudarPessoa(idade: 32, nome:"Maria"); // A ordem ja nao vai importar, mas é preciso escrever o nome das variaveis

  // Função em variável
  // tipo nome = valor;
  int Function(int, int) soma1 = somaFn; // Variavel soma1 recebe a funcao somaFN
  print(soma1(20, 313));
  
  int Function(int, int) soma2 = (int x, y) // Funcao anonima
  {
    return x + y;
  };
  print(soma2(25, 37));

  String Function( String, String) str = (str1, str2)
  {
    return (str1 + " " + str2).toUpperCase();
  };
  print(str( "Hello", "world"));

  var soma3 = (x,y) // Podemos usar o var
  {
    return x + y;
  };
  print(soma3(33, 44));

  var adicao = (int a, int b) =>
  {
    a + b
  }; // Função arrow - mas também é um Set

  var subtracao = (int a, int b) => a - b; // Sem as chaves no retorno não é considerado do tipo Set
  int Function(int, int) multiplicacao = (int a, int b) => a * b;
  var divisao = (int a, int b) => a / b;

  print(adicao(4,15));
  print(adicao(1,1) is Set);
  print(subtracao(4,7));
  print(multiplicacao(12,12));
  print(divisao(16,3));

}
