import 'package:flutter/material.dart';

// Classe usada para fraser a transição específica entre telas com certa animação
class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (settings.name == '/') { // Se caso desejar criar uma lógica específica para alguma rota
    //   return child;
    // }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

// Classe usada para fazer a transição geral entre as telas do app com certa animação
class CustomPageTransitionBuilder extends PageTransitionsBuilder
{ 

  CustomPageTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ){
    // if (route.settings.name == '/') { // Se caso desejar criar uma lógica específica para alguma rota
    //   return child;
    // }
    
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}