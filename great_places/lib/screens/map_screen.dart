import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

// Tela que aparece o mapa do google maps para selecionarmos uma localização
class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;
  final String? placeTitle; 

  const MapScreen({
    this.placeTitle,
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
  LatLng? _pickedLocation;


  void _selectPosition(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isReadOnly ? Text("Localização de ${widget.placeTitle}") : Text("Selecione a localização"),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              onPressed:
                  _pickedLocation == null
                      ? null
                      : () => Navigator.of(context).pop(_pickedLocation), // Retorna a lolcalização selecionada
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
            (_pickedLocation == null && !widget.isReadOnly)
                ? {}
                : {
                  Marker(markerId: MarkerId('p1'), position: _pickedLocation ?? widget.initialLocation.toLatLng()),
                },
        onTap: widget.isReadOnly ? null : _selectPosition,
      ),
    );
  }
}
