import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/exceptions/auth_exception.dart';
import 'package:store/models/auth.dart';

enum AuthMode { login, signUp }

// Widget que representa o quadrado de autenticação com os campos de login ou signUp
class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  var _passWordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  AuthMode _authMode = AuthMode.login;

  Map<String, String> _authData = {'Email': '', 'Password': ''};

  bool isLogin() => _authMode == AuthMode.login ? true : false;
  bool isSignUp() => _authMode == AuthMode.signUp ? true : false;

  void switchAuthMode() {
    setState(() {
      isLogin() ? _authMode = AuthMode.signUp : _authMode = AuthMode.login;
    });
  }

  void _showErroDialog(String error) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Ocorreu um erro'),
              content: Text(error),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Fechar'))
              ],
            ));
  }

  // Função que faz a chamada da subimissão dos dados do login/signUp
  Future<void> _submit() async {

    final isValid = _formKey.currentState!.validate(); // Percorre todos os campos do Form e executa os validator definidos

    if (!isValid) return;

    _formKey.currentState!
        .save(); // Chama o onSaved de cada TextFormField, preenchendo _authData com os valores digitados
    
    var authProvider = Provider.of<Auth>(context, listen: false);

    setState(() => _isLoading = true);

    try {
      if (isLogin()) {
        await authProvider.login(_authData['Email']!, _authData['Password']!);
      } else {
        await authProvider.signUp(_authData['Email']!, _authData['Password']!);
      }
    } on AuthException catch (error) {
      _showErroDialog(error.toString());

    } catch (error)
    {
      _showErroDialog('Ocorreu um erro inesperado !');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.fromLTRB(
          0,
          50,
          0,
          mediaQuery.viewInsets.bottom + 16,
        ),
        // margin: const EdgeInsets.only(top:50),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: isLogin() ? 330 : 400,
          width: mediaQuery.size.width * 0.8,

          // Formulário propriamente dito
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
                  decoration: const InputDecoration(labelText: "Password"),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  onSaved: (passWord) => _authData['Password'] = passWord ?? '',
                  controller: _passWordController,
                  validator: (_passWord) {
                    final passWord = _passWord ?? '';
                    if (passWord.isEmpty || passWord.length < 3) {
                      return 'Informe uma senha com mais de 3 caracteres';
                    }
                    return null;
                  }
                  ,
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
                _isLoading
                    ? const CircularProgressIndicator()
                    : Ink(
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
      ),
    );
  }
}
