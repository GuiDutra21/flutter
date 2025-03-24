import 'dart:io';

// Classe modelo que representa um local
class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File iamgem;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.iamgem,
  });
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}
