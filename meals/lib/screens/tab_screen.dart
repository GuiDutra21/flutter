import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screens.dart';
import 'package:meals/screens/favorite_screen.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favorites;
  const TabScreen(this.favorites, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

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
      body: _screens[_selectedScreenIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: temaPrincipal.primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: temaPrincipal.canvasColor,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categoria",
          ),
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
