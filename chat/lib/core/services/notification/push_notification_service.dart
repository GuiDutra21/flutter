import 'package:chat/components/chat_notification.dart';
import 'package:flutter/material.dart';

class PushNotificationService with ChangeNotifier{
  List<ChatNotification> _items = [];

  List<ChatNotification> get items  => [..._items]; // Retorna a copia da lista

  void add(ChatNotification notification)
  {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int index)
  {
    _items.removeAt(index);
    notifyListeners();
  }
}