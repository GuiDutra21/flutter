import 'dart:io';

main ()
{
  // Area da circunferencia = PI * area * area

  /*  String texto = stdin.readLineSync()!;
    print(texto);
    print("a palavra/frase digitada foi : " + texto);*/

    var entradaDoUsuario = stdin.readLineSync()!;
    var raio = double.parse(entradaDoUsuario); // converte a string em double
    print("o raio informado foi : " + raio.toString ());
  /*
    --para converter em constante basta declarar como final
    final raio2 = 2;
    print(raio2);

    --para entrar com os dados na mesma linha usamos:
    stdout.write("digite algo aqui : ");
    var aleatorio = stdin.readLineSync()!;
    stdout.write(aleatorio);
    */

    // o nome final não é uma variável e sim uma palavra que indica que teremos uma constante, similar aos tipos de variáveis
    final PI = 3.1415;
    final area = PI * raio * raio;
    print("O valor da area eh : " + area.toString());

    //const é so quando já definimos o valor, nao recebe valor do teclado
    //já o final pode receber valores do teclado 
    
}