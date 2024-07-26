
main()
{
    String nome = 'Joao';
    String status = 'aprovado';
    double nota = 9.2;

    // O espaço é necessário, se não sai tudo junto
    String frase1 = nome + " esta " + status + " porque tirou nota : " + nota.toString() + '!'; 
    print (frase1);

    // Com interpolação
    String frase2 = "$nome esta $status porque tirou uma nota $nota!!";
    print(frase2);

    print("1 + 1 = ${1 + 1}");
    print("1 + 1 = \$1 + 1"); // O barra antes tira a funcao do $

}