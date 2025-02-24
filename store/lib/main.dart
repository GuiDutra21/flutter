import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/auth.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/order_list.dart';
import 'package:store/models/product_list.dart';
import 'package:store/screens/auth_screen.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/order_screen.dart';
import 'package:store/screens/product_detail_screen.dart';
import 'package:store/screens/product_form_screen.dart';
import 'package:store/screens/products_overview_screen.dart';
import 'package:store/utils/app_routes.dart';

import 'screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return 
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ProductList(), // Cria o ChangeNotifier para a classe que contém o dado
          ),
          ChangeNotifierProvider(
            create: (_) => Cart(), 
          ),
          ChangeNotifierProvider(
            create: (_) => OrderList(), 
          ),
          ChangeNotifierProvider(
            create: (_) => Auth(), 
          ),
        ],

        child: MaterialApp(
          title: 'Store Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
        
            // Usando o ColorScheme para definir as cores principais
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              primary: Colors.blue,   // Cor primária
              secondary: Colors.orange, // Cor de destaque
              brightness: Brightness.light,
            ),
            
            // Tema do appBar
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue[400],
              centerTitle: true,
            ),
        
            // Cor de fundo do app
            scaffoldBackgroundColor: const Color.fromARGB(255, 223, 214, 189),
            // scaffoldBackgroundColor: const Color.fromARGB(233, 255, 248, 225),
        
            fontFamily: 'Lato',
            useMaterial3: true,
          ),
          routes: 
          { 
            AppRoutes.auth: (context) => const  AuthScreen(),
            AppRoutes.home: (context) => const  ProductsOverviewScreen(),
            AppRoutes.productDetail: (context) => const ProductDetailScreen(),
            AppRoutes.cart: (context) => const CartScreen(),
            AppRoutes.orders: (context) =>  const OrderScreen(),
            AppRoutes.products: (context) =>  const ProductsScreen(),
            AppRoutes.productsForm: (context) =>  const ProductFormScreen(),
          },
          // home: const  ProductsOverviewScreen(),
        ),
    );
  }
}

