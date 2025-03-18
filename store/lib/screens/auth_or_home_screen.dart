import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/auth.dart';
import 'package:store/screens/auth_screen.dart';
import 'package:store/screens/products_overview_screen.dart';

// Tela inicial da aplicação que leva ou para a tela dos produtos ou continua na tela de autenticação
class AuthOrHomeScreen extends StatelessWidget {
  // Construtor
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth authProvider = Provider.of(context);
    return FutureBuilder(
        future: authProvider.tryAutoLogin(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          
          } else if (snapshot.error != null) {
            return const Center(
              child: Text('Ocorreu um erro'),
            );
          }
          
          return authProvider.isAuth
              ? const ProductsOverviewScreen()
              : const AuthScreen();
        });
  }
}
