import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

// Classe que representa o Drawer da aplicacção
class AppDrawer extends StatelessWidget {

  // Construtor
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [

          AppBar(
            title: const Text("Seja Bem vindo!"),
            automaticallyImplyLeading: false, // Para remover o ícone do Drawer quando o Drawer está aparecendo
          ),

          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
            },
          ),
          
          const Divider(
            color: Colors.black54,
          ),
          
          ListTile(
            leading: const Icon(Icons.local_mall_rounded),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.orders);
            },
          ),
          
          const Divider(
            color: Colors.black54,
          ),
          
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Gerenciar Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.products);
            },
          ),
          
          const Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
