import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

// Provider que contem a lista dos lugares
class GratePalces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index){
    return _items[index];
  }
}