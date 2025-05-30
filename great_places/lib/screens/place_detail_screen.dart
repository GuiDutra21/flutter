import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/screens/map_screen.dart';

// Tela de detalhes dos lugares
class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)?.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              place.location?.address ??
                  'Para ver a localização selecione o botão abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ),

          SizedBox(height: 10),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => MapScreen(
                        placeTitle: place.title,
                        initialLocation: place.location!,
                        isReadOnly: true,
                      ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: Icon(Icons.map, size: 27),
            label: Text("Ver no mapa", style: TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
