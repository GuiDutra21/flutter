import 'dart:math';
  
  // Funcao que recebe duas outras funcoes como parametros
  void executar(Function fnPar, Function fnImpar)
  {
    int valor = Random().nextInt(10);
    valor % 2 == 0 ? fnPar() : fnImpar();
    print("O valor sortedo foi : $valor");
  }

  void executarPor(int qtd, void Function(String) fn, String value) // Função que foi passada como parâmetro foi a função print
  { 
    for(int i = 0; i < qtd; i++)
    {
     fn(value);
    } 
  }

  // Funcao que recebe outra funcao como parametro e retorna o tamanho da String que foi concatenada
  int executarPor_2(int quanitdade, String Function(String) funcao, String texto)
  {
    String textoCompleto = ""; // Cria uma string vaizia
    for(int j = 0; j < quanitdade; j++)
    {
      textoCompleto += funcao(texto); // Concatena com a String advinda do retorno da funcao
    }
    print("Concatenacao : $textoCompleto");
    return textoCompleto.length;
  }

  main()
  {
    var minhaFnPar = () => print('Eita! O valor eh par!'); // Funcao qualquer que sera passada como parametro
    void Function() minhaFnImpar = () => print('Incrivel! O valor eh impar!'); // Funcao qualquer que sera passada como parametro

    executar(minhaFnPar, minhaFnImpar);

    print('------');
    
    executarPor(5, print, "Vou conseguir !");

    print('------');

    String Function(String) meuPrint = (String texto)
    {
      print(texto);
      return texto;
    };

    print(executarPor_2(4, meuPrint, 'Valeu a pena, '));
  
  }