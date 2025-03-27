import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_utils.dart';

// Provider que contem a lista dos lugares
class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final Place newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );

    _items.add(newPlace);
    DBUtils.insert(
      'PLACES', {
        'id' : newPlace.id,
        'title' : newPlace.title,
        'image' : newPlace.image.path, // Passa apenas o caminho da imagem, pois ela será salva em uma pasta da aplicação
      }
    );
    notifyListeners();
  }
}
