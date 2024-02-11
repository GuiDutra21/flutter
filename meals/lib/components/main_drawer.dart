import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

// Classe que representa o drawer 
// (parte que aparece na lateral quando selecionamos o ícone com 3 linhas )
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  // Função para gerar os elementos do drawer
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
    ThemeData tema = Theme.of(context);// Só para não ficar chamando várias vezes

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
            
            const SizedBox(height: 29), // apenas para dar um espaço

            // Elementos do Drawer (Refeições)
            _createItem(
              Icons.restaurant,
              "Refeições",
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),

            // Elementos do Drawer (Configurações)
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
