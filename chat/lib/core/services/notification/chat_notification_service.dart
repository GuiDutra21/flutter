import 'package:chat/components/chat_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];

  List<ChatNotification> get items => [..._items]; // Retorna a copia da lista

  int get itemsCount => _items.length;

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  Future<void> init() async {
    await _configureTerminated();
    await _configureForeground();
    await _configureBackground();
  }

  // Para saber se o usuario autoriza receber notificacoes
  Future<bool> get _isAuthorized async {
    final messaging = FirebaseMessaging.instance;
    final settings =
        await messaging.requestPermission(); // Funcao que faz a pergunta
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  // Mensagens quando o usuario esta usando o app
  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen(_messageHandler);
    }
  }

  // Mensagens quando o usuario nao esta usando o app
  Future<void> _configureBackground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessageOpenedApp.listen(_messageHandler);
    }
  }

  // Quando o usuario abre o app a partir da notificao
  Future<void> _configureTerminated() async {
    if (await _isAuthorized) {
      RemoteMessage? initalMsg = await FirebaseMessaging.instance.getInitialMessage();
      _messageHandler(initalMsg);
    }
  }

  void _messageHandler(RemoteMessage? msg) { // Escuta as mensagens e adiciona quando aparece uma nova
        if (msg != null || msg?.notification != null) {
          add(
            ChatNotification(
              title: msg?.notification!.title ?? 'Não informado',
              body: msg?.notification!.body ?? 'Não informado',
            ),
          );
        }
      }
}
