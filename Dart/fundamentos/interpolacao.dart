
main()
{
    String nome = 'Joao';
    String status = 'aprovado';
    double nota = 9.2;

    String frase1 = nome + " esta " + status + "porque tirou nota : "
    + nota.toString() + '!'; // o espaço é necessário, se não sai tudo junto
    print (frase1);

    // com interpolação
    String frase2 = "$nome esta $status porque tirou uma nota $nota!!";
    print(frase2);

    print("1 + 1 = ${1 + 1}");
    print("1 + 1 = \$1 + 1");// o barra antes tira a funcao do $

}