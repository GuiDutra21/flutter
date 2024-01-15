import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screens.dart';
 
void main() =>  runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Para remover o banner de DEMO

      theme: ThemeData(
        fontFamily: 'Raleway', // Não sei se está fazendo alguma diferença

        colorScheme:  ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
            backgroundColor: const Color.fromARGB(255, 240, 238, 183),
          ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle( fontFamily: 'Raleway', fontSize: 23)
          ),

        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const  TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          ),
        ),
        canvasColor: Colors.amber, // Não sei se está fazendo alguma diferença
        ),
        
      home: const CategoriesScreens(), // Chama a tela principal
    );
  }
}
