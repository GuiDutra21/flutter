import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Auth with ChangeNotifier  {

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



      print(response.body);
  }

  Future<void> signUp(String email, String password) async
  {
    _authenticate(email, password, 'signUp' );

  }
  
  Future<void> login(String email, String password) async
  {
    _authenticate(email, password, 'signInWithPassword' );

  }
}