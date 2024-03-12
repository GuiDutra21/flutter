import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/util/app_routes.dart';

import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Provider referente à lista de produtos 
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
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
            accentColor: Colors.red,
            brightness: Brightness.light,
          ),
          fontFamily: 'Lato',
          useMaterial3: true,
        ),
        home: const ProductsOverviewScreen(),
      
        routes: {
        AppRoutes.productDetail : (context) => const ProductDetailScreen(),
      
        }
      ),
    );
  }
}
