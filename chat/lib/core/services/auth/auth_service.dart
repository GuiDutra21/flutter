import 'dart:async';
import 'dart:io';
import 'package:chat/core/models/chat_user.dart';

// Classe abstrata referente ao serviço de autenticação, lembra uma interface do java,
abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges; // "Necessario" por conta da estrutura do firebase

  Future<void> login(String email, String password);

  Future<void> signup(String name, String email, String password, File? image);

  Future<void> logout();
}
