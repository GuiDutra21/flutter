import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(decoration: InputDecoration(labelText: 'Nome'),),
              TextFormField(decoration: InputDecoration(labelText: 'E-mail')),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(child: Text('Criar uma conta ?'), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
