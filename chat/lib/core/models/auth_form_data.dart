import 'dart:io';

// Classe modelo que representa os dados do formulário
enum AuthMode {Signup, Login}

class AuthFormData {

  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode _mode = AuthMode.Login;

  bool get isLogin
  {
    return _mode == AuthMode.Login; 
  }

  bool get isSignup
  {
    return _mode == AuthMode.Signup; 
  }

  void toggleAuthMode()
  {
    _mode = isLogin ? AuthMode.Signup : AuthMode.Login ;
  }
}