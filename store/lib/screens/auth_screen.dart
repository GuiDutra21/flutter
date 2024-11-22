import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/components/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).unfocus(); // Remove o foco (esconde o teclado)
      },
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.blue,
                Color.fromARGB(255, 74, 85, 234),
                Colors.blue,
              ],
              stops: [
                0.2, // Início da primeira cor
                0.3, // Início da segunda cor
                0.8, // Início da terceira cor
              ],
              begin: Alignment.topLeft, // Início no canto superior esquerdo
              end: Alignment.bottomRight, // Fim no canto inferior direito
            )),
          ),
      
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(
                      blurRadius: 8,
                      color: Colors.black,
                      offset: Offset(0,2),
                    ),],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red[700],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                  transform: Matrix4.rotationZ(-8*pi/180)..translate(-10.0), // Esses dois pontos representa o cascade operator
                  child: const Text(
                    "Minha Loja",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Anton', fontSize: 45),
                  ),
                ),
                Flexible(fit: FlexFit.loose , child: AuthForm()),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
