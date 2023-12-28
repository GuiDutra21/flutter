import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Classe que cria a parte da entrada de dados das transações de acordo com o sistema operacional 
class AdaptativeTextField extends StatelessWidget {
  
  // Atributos
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final Function(String) onSubmitted;
  //final TextInputType.numberWithOptions(decimal: true); 

  // Construtor
   const AdaptativeTextField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.onSubmitted,
    super.key
    });

  // Retorna a árvore de Widgets
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?

    Padding( // No IOS
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: CupertinoTextField(
        controller: controller,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        placeholder: label,
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12
        ),
        ),
    )

    : TextField( // No Android
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted:  onSubmitted,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}