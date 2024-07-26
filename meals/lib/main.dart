import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/setting.dart';
import 'package:meals/screens/categories_meals__screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tab_screen.dart';
 
void main() =>  runApp(const MyApp());
 
class MyApp extends StatefulWidget {

  const MyApp({super.key});
 
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{ 

  // Principais variáveis do aplicativo
  Setting settings = Setting();
  List <Meal> _availableMeals = dummyMeals;
  List<Meal> _favorites = [];

  void _filterMeals(Setting settings){
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose= settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal)
  {
    setState(() {
      _favorites.contains(meal)? _favorites.remove(meal): _favorites.add(meal);
    });
  }

  bool _isFavorite(Meal meal)
  {
    return _favorites.contains(meal);
  }


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
          titleTextStyle: TextStyle( fontFamily: 'Raleway', fontSize: 23),
          centerTitle: true, // Para centralizar os titulos no android
          iconTheme: IconThemeData(
            color: Colors.white, // A cor para o ícone do Drawer e para qualquer outro ícone que aparecer no appBar
          ),
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
        AppRoutes.home:(context) =>  TabScreen(_favorites), // Chama a tela principal
        AppRoutes.categories_meals: (context) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.meals_details: (context) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (context) =>  SettingsScreen(settings, _filterMeals),
      }
    );
  }
}