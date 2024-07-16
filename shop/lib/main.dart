import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/util/app_routes.dart';

import 'models/cart.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Permite a criação de vários providers
    return MultiProvider(
      providers: [
      
      // Provider referente à lista de produtos
      ChangeNotifierProvider(
        // literalmente criamos uma classe que possui um mixin do tipo ChangeNotifier 
        create: (_) => ProductList(), 
        ),

      ChangeNotifierProvider(
        create: (_) => Cart(),
      )
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false, // Para remover o banner de DEBUG
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              centerTitle: true,
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
              cardColor: const Color.fromARGB(255, 23, 206, 32),
              backgroundColor: const Color.fromARGB(255, 19,18,64),
              brightness: Brightness.light,
            ),
            focusColor: Colors.amber,
            fontFamily: 'Lato',
            useMaterial3: true,
          ),
          home: const ProductsOverviewScreen(),
        
          routes: {
          AppRoutes.productDetail : (context) => const ProductDetailScreen(),
          AppRoutes.cart : (context) =>  CartScreen(),
          }
        ),
    );
  }
}
