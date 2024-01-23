import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, void Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black54,
      ),
      title: Text( 
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold)
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return Drawer(
      backgroundColor: tema.colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: tema.canvasColor,
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Vamos Cozinhar ?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: tema.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 29),
            _createItem(
              Icons.restaurant,
              "Refeições",
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            _createItem(
              Icons.settings,
              "Configurações",
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
