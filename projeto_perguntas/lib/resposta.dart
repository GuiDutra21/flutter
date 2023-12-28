import 'package:flutter/material.dart';

class Resposta extends StatelessWidget
{ 
  const Resposta(this.texto, this.quandoSelecionado, {super.key});
  final String texto;
  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context)
  { 
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
        ),
    );
  }
}