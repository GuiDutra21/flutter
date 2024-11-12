import 'package:flutter/material.dart';

enum AuthMode { login, signUp }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

void _submit() {}

class _AuthFormState extends State<AuthForm> {
  var _passWordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  AuthMode _authMode = AuthMode.login;

  Map<String, String> _authData = {'Email': '', 'Senha': ''};

  bool isLogin() => _authMode == AuthMode.login ? true : false;
  bool isSignUp() => _authMode == AuthMode.signUp ? true : false;

  void switchAuthMode() {
    setState(() {
      isLogin() ? _authMode = AuthMode.signUp : _authMode = AuthMode.login;
    });
  }

  void _submit() {

    final isValid = _formKey.currentState!.validate();

    if(!isValid)
      return;
    
    _formKey.currentState!.save(); // Salva os dados passado no textFormField no atributo save

    if( isLogin())
    {
      // Login
    }
    else
    {
      // Resgristrar
    }
  
    setState(() =>
      _isLoading = true
    );
    setState(() =>
      _isLoading = false
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Card(
      margin: const EdgeInsets.only(top: 50),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: isLogin() ? 330 : 400,
        width: screenSize.width * 0.8,
        child: Form(
          key: _formKey, // Para savar as informações
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['Email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                onSaved: (passWord) => _authData['Senha'] = passWord ?? '',
                controller: _passWordController,
                validator: (_passWord) {
                  final passWord = _passWord ?? '';
                  if (passWord.isEmpty || passWord.length < 3) {
                    return 'Informe uma senha com mais de 3 caracteres';
                  }
                  return null;
                },
              ),
              if (isSignUp())
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Confirmar senha"),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: (_confirmed) {
                    final confirmed = _confirmed ?? '';
                    if (confirmed != _passWordController.text) {
                      return 'As senhas informadas não coincidem !';
                    }
                    return null;
                  },
                ),
              const Spacer(flex: 3),
               _isLoading ? const CircularProgressIndicator() : Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.green,
                  onTap: _submit,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Text(
                      isLogin() ? "ENTRAR" : 'REGISTRAR',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3),
              Text(isLogin() ? 'Não tem uma conta ?' : 'já possui conta ?'),
              TextButton(
                  onPressed: () => switchAuthMode(),
                  child: Text(isLogin() ? 'CRIAR CONTA' : 'IR PARA O LOGIN'))
            ],
          ),
        ),
      ),
    );
  }
}
