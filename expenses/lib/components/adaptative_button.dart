import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Classe que representa os butões de 'Nova Trnsação' para cada S.O.
class AdaptativeButton extends StatelessWidget
{ 
  // Atributos
  final String label;
  final Function() onPressed;
  
  // Construtor
  const AdaptativeButton(
  {
    required this.label,
    required this.onPressed,
    super.key
  });

  // Retorna a árvore de Widgets
  @override 
  Widget build(BuildContext context)
  {
    return Platform.isIOS ? 

    CupertinoButton( // No IOS
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Text(label),
    )

    : TextButton( // No Android
        style: TextButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white
          ),
        onPressed: onPressed,
        child: Text(
                  label,
                  style: const TextStyle(fontSize: 18),
          ),
      );
  }
}

