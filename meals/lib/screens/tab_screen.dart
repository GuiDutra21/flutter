import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screens.dart';
import 'package:meals/screens/favorite_screen.dart';
import '../models/meal.dart';

// Classe que contém as duas telas principais, de categorias e de favoritos
class TabScreen extends StatefulWidget {

  // Atributo
  final List<Meal> favorites;

  // Construtor
  const TabScreen(this.favorites, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  // Dados que são iniciados junto com o estado do Widget, telas com os seuys respectivos nomes
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        "title": "Lista de categorias",
        "screen": const CategoriesScreens(),
      },
      {
        "title": "Meus favoritos",
        "screen": FavoriteScreen(widget.favorites),
      }
    ];
  }

  // Fução para mudar as telas
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Só para não ficar chamando várias vezes
    ThemeData temaPrincipal = Theme.of(context);

    return Scaffold(

      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"] as String),
      ),

      // Telas
      body: _screens[_selectedScreenIndex]["screen"] as Widget,

      // Tab bar inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: temaPrincipal.primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: temaPrincipal.canvasColor,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [

        // Parte do ícone e texto de categorias
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categorias",
          ),

          // Parte do ícone e texto de Favoritos
          BottomNavigationBarItem(
            label: "Favoritos",
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
