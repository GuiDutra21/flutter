main ()
{
    int n1 = 3;
    double n2 = (-12.45).abs(); // converte em positivo
    print(n2.abs()); // outro jeito para entregar o modulo 

    double n3 = double.parse("14.78"); // converte a string em double
    print(n1+n2+n3);

    num n4 = 6;
    n4 = 90.9; // pode receber tanto int quanto double

    String s1 = "Bom";
    String s2 = " Dia !";

    print(s1+s2.toUpperCase() + "!!!");

    bool estaChovendo = false;
    bool muitoFrio = false;

    print(estaChovendo && muitoFrio);

    dynamic x; // o tipo da variavel pode variar com o decorrer do codigo

    x = "ola";
    x = 123;
    x = true;
}