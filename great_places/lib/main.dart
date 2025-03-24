import 'package:flutter/material.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',

      theme: ThemeData(
        // Tema principal
         colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigo,
          secondary: Colors.amber,
        ),

        // Tema do appBar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),

        // Cor de fundo
        scaffoldBackgroundColor: const Color.fromARGB(233, 255, 248, 225),

        //  visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      routes: {
        AppRoutes.placesForm : (context) => PlaceFormScreen()
      },
      home: const PlacesListScreen(),
    );
  }
}
