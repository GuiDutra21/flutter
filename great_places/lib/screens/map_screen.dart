import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

// Tela que aparece o mapa do google maps para selecionarmos uma localização
class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapScreen({
    this.initialLocation = const PlaceLocation(
      // New York
      latitude: 40.758896,
      longitude: -73.985130,
    ),
    this.isReadOnly = false,
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione a localização"),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              onPressed:
                  _pickedPosition == null
                      ? null
                      : () => Navigator.of(context).pop(_pickedPosition),
              icon: Icon(Icons.check),
            ),
        ],
      ),
      
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        markers:
            _pickedPosition == null
                ? {}
                : {
                  Marker(markerId: MarkerId('p1'), position: _pickedPosition!),
                },
        onTap: widget.isReadOnly ? null : _selectPosition,
      ),
    );
  }
}
