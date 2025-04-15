import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_utils.dart';
import 'package:great_places/utils/location_utils.dart';

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

  Future<void> addPlace(String title, File image, LatLng position) async {
    final String address = await LocationUtils.geAddressFrom(position);

    final Place newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );

    _items.add(newPlace);
    DBUtils.insert('PLACES', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image':
          newPlace
              .image
              .path, // Passa apenas o caminho da imagem, pois ela será salva em uma pasta da aplicação
      'latitude' : position.latitude,
      'longitude' : position.longitude,
      'address' : address,
    });
    notifyListeners();
  }

  Future<void> loadProducts() async {
    final DBPlaces = await DBUtils.select('PLACES');
    _items =
        DBPlaces.map((items) {
          return Place(
            id:
                items['id']
                    as String, // Necessita do casting devido ao argumento Object no retorno da função DBUtils.select
            title: items['title'] as String,
            image: File(items['image'] as String),
            location: PlaceLocation(
              latitude: items['latitude'] as double,
              longitude: items['longitude'] as double,
              address: items['address'] as String,
            ),
          );
        }).toList();

    notifyListeners();
  }
}
