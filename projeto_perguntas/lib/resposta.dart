import 'package:flutter/material.dart';

class Resposta extends StatelessWidget
{ 
  const Resposta(this.texto, this.quandoSelecionado, {super.key});
  final String texto;
  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context)
  { 
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0), // Defina o raio como 0 para remover a borda circular
          ),
        ),
        onPressed: quandoSelecionado,
        child: Text(
          style: const TextStyle(fontSize: 17),
          texto,
          ),
        ),
    );
  }
}