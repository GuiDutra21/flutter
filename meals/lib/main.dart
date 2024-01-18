import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals__screen.dart';
import 'package:meals/screens/categories_screens.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
 
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
            primarySwatch: Colors.pink, // Não sei se está fazendo alguma diferença
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
        canvasColor: Colors.amber,
        ),
      
      // A primeira rota no map é definida como a primeira a ser carregada,
      // ou seja a tela padrão/princial do aplicativo
      // Também poderia ter usado o atributo initialRoute:
      routes: {
        AppRoutes.home:(context) => const CategoriesScreens(), // Chama a tela principal
        AppRoutes.categories_meals: (context) => const CategoriesMealsScreen(),
        AppRoutes.meals_details: (context) => const MealDetailScreen(),
      }
    );
  }
}
