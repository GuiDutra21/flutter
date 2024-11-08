import 'package:flutter/material.dart';

enum AuthMode { login, sigUp }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

void _submit() {}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    AuthMode authMode = AuthMode.login;

    return Card(
      margin: const EdgeInsets.only(top: 50),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: authMode == AuthMode.login ? 270 : 320,
        width: screenSize.width * 0.8,
        child: Form(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),

              if (authMode == AuthMode.sigUp)
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Confirmar senha"),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                ),
              const Spacer(flex: 3),
              InkWell(
                splashColor: Colors.amber,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.fromLTRB(25,15,25,15)
                  ),
                    onPressed: _submit,
                    child: authMode == AuthMode.sigUp
                        ? const Text("REGISTRAR", style: TextStyle(color: Colors.white),)
                        : const Text("CADASTRAR", style: TextStyle(color: Colors.white),)
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
