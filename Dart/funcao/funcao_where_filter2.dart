
main()
{
  List<double> notas = [8.9, 5.7, 7.7, 5.4, 4.5, 9.3, 6.2, 8.3];
  
  bool Function(double) notasBoasFn = (double nota) => nota >= 7; // Poderia usar o var
  bool Function(double) notasMuitoBoasFn = (double nota) => nota >= 8.9;

  // Iterable<double>
  var notasBoas = notas.where(notasBoasFn);
  
  // Iterable<double>
  var notasMuitoBoas = notas.where(notasMuitoBoasFn);

  // Iterable<double>
  var notasExcelentes = notas.where((e) => e > 9);

  print(notas);
  print(notasBoas);
  print(notasMuitoBoas);
  print(notasExcelentes);
}