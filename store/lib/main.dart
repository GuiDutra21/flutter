import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/auth.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/order_list.dart';
import 'package:store/models/product_list.dart';
import 'package:store/screens/auth_or_home_screen.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/order_screen.dart';
import 'package:store/screens/product_detail_screen.dart';
import 'package:store/screens/product_form_screen.dart';
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
            create: (_) => Auth(), // Cria o ChangeNotifier para a classe que contém o dado
          ),
          
          ChangeNotifierProxyProvider<Auth, ProductList>( // Quando um provider depende/usa de dados de outro usamos o ProxyProvider
            create: (_) => ProductList(), 
            update: (context, auth, previous) => 
            ProductList(auth.token ?? '' , auth.userId ?? '', previous?.items ?? []) // Atualiza o token, mas mantem a lista, por isso o previous
          ),

          ChangeNotifierProxyProvider<Auth, OrderList>(
            create: (_) => OrderList(),
            update:(context, auth, previous) => 
            OrderList(auth.token ?? '',  auth.userId ?? '', previous?.items ?? []),
          ),
          
          ChangeNotifierProvider(
            create: (_) => Cart(), 
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
            AppRoutes.authOrHome: (context) => const  AuthOrHomeScreen(),
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