main ()
{
    double nota = 6.99;
    nota = nota.roundToDouble(); // Arredonda
    // Ou ja poderiamos inicializar da seguinte forma : nota = 6.99.roundToDouble();

    nota = nota.truncateToDouble(); // Tira as casas decimais
    print(nota);
    print("texto".toUpperCase());

    String s1 = "Guilherme Silva";
    String s2 = s1.substring(0,9);
    String s3 = s2.padRight(15, "-~");
    print (s3);

    var s5 = 'Guilherme Silva'.substring(0, 9).toUpperCase().padRight(15, 'top');
    print(s5);
}