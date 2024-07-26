import 'dart:io';
main ()
{
    int n1 = 55;
    print(n1);
    int n2 = 6;

    // nao aceita
    // int resultado = n1/n2;   
    // print(resultado);

    bool ehFragil = true;
    bool ehCaro = false;

    print(ehFragil && ehCaro); // AND -> E
    print(" "); // o print ja pula a linha naturalmente
    print(ehFragil || ehCaro); // OR -> OU 
    print(ehFragil ^ ehCaro); // XOR -> OU Exclusivo
    print(!ehFragil); // NOT -> negacao
    print(!!ehFragil);

    double a = 4;
    a += 4;
    a -= 4;
    a *= 4;
    a /= 4;
    a %= 4;

    /*bit a bit 
            101 = 5
            100 = 4
    5 & 4 = 100 = 4
    */
    print(5 & 4);

    int teste = 4;

    //print(++teste);
    print(teste++);

    print("Esta chovendo? (S/N) \n");
    bool estaChovendo = stdin.readLineSync()! == 'S';

    print("EstaFrio? (S/N) \n");
    bool estaFrio = stdin.readLineSync()! == 'S';

    //Operador ternario
    String resultado = estaChovendo || estaFrio ? "Ficar em casa" : "Sair de casa";
    print(resultado);

    print(estaChovendo && estaFrio ? "Azarado " : "Sortudo");
}