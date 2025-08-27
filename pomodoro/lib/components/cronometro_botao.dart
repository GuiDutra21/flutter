import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;

  const CronometroBotao({required this.icone, required this.texto, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        iconColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icone, size: 35),
          ),
          Text(texto, style: TextStyle(color: Colors.white, fontSize: 25)),
        ],
      ),
    );
  }
}
