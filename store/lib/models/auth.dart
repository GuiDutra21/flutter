import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:store/exceptions/auth_exception.dart';

// Classe 'criada' pelo ChangeNotifyProvider e que contém os métodos de autenticação 
class Auth with ChangeNotifier  {

  // Método de autenticação
  Future<void> _authenticate(String email, String password, String urlFragment) async
  {

    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDkBvCMZCTNLqgEMGXIZlDds34x6tFeIT8';
    final response = await post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),

    );

    final body = jsonDecode(response.body);

    if(body['error'] != null)
    {
        throw AuthException(body['error']['message']);
    }
  }

  Future<void> signUp(String email, String password) async
  {
    return _authenticate(email, password, 'signUp' );

  }
  
  Future<void> login(String email, String password) async
  {
    return _authenticate(email, password, 'signInWithPassword' );
  }
}