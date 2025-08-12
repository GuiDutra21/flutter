import 'package:chat/components/chat_notification.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier{
  List<ChatNotification> _items = [];

  List<ChatNotification> get items  => [..._items]; // Retorna a copia da lista

  int get itemsCount  =>_items.length;

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