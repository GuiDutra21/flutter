
main()
{
  List<double> notas = [8.9, 5.7, 7.7, 5.4, 4.5, 9.3, 6.2, 8.3];
  
  bool Function(double) notasBoasFn = (double nota) => nota >= 7; // poderia usar o var
  bool Function(double) notasMuitoBoasFn = (double nota) => nota >= 8.9;

  //Interable<double>
  var notasBoas = notas.where(notasBoasFn);
  
  //Interable<double>
  var notasMuitoBoas = notas.where(notasMuitoBoasFn);

  print(notas);
  print(notasBoas);
  print(notasMuitoBoas);
}