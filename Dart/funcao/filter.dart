// import 'dart:ffi';

main()
{
  List notas = [8.9, 5.7, 7.7, 5.4, 4.5, 9.3, 6.2, 8.3];
  List notasBoas = [];

  for(double indice in notas)
  { 
    if(indice >= 7)
    notasBoas.add(indice);
  }

  print(notas);
  print(notasBoas);
  
}