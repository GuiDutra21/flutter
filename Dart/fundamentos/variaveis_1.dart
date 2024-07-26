main ()
{
    int a = 0;
    double b = 3.1314;
    var c = 9.90;
    var texto = "O valor da soma eh : ";

    print(a);
    print(a * b);
    print(c);
    print( texto + ( b + c).toString() );
    print(texto.runtimeType); //printa o tipo da variavel
    print(c is double);//printa true ou valse 
}