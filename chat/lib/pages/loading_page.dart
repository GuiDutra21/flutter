import 'package:flutter/material.dart';

// Tela de login que é utilizada para algumas ações
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RefreshProgressIndicator(),
            SizedBox(height: 10),
            Text("Loading", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
