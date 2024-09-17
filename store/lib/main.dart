import 'package:flutter/material.dart';
import 'package:store/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        // Usando o ColorScheme para definir as cores principais
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,   // Cor primária
          secondary: Colors.orange, // Cor de destaque
          brightness: Brightness.light,

        ),
        
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        scaffoldBackgroundColor: Colors.yellow[50],
        fontFamily: 'Lato',
        useMaterial3: true,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}

