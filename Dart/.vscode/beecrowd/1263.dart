import 'dart:io';

main()
{ 
  String dados;
  while(true)
  { 
    dados = stdin.readLineSync().toString().toLowerCase();//leitura
    if(dados.length == 0)
    {
      break;
    } 

    List frase = dados.split("");//transforma a string em uma lista
    int i = 0;
    int aliteracao = 0;
    int tamanho = frase.length;
    int letra = frase[0].codeUnitAt(0);//transforma o caracter no numero dele de acordo com a tabela ASC2
    bool jaContou = false;
    for(i = 0; i < tamanho; i++)
    {
      if(frase[i] == " ")
      { 
        int verificador = frase[i + 1].codeUnitAt(0);//Se encontrar um espaço compara com a letra inicial da proxima palavra
        if(letra == verificador )
        { 
          if(jaContou == false)
          {
          aliteracao++;
          jaContou = true;//recebe true para nao contar mais de uma vez
          } 
        }
        else
        {
          letra = verificador;
          jaContou = false;
        }
      }
    }
    print(aliteracao);
  }

  /*int c = "a".codeUnitAt(0);
  int end = "z".codeUnitAt(0);
  while (c <= end) {
  print(String.fromCharCode(c));
  c++;*/
}