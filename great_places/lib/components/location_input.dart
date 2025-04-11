import 'package:flutter/material.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_utils.dart';
import 'package:location/location.dart';

// Componente que mostra o mapa e os botões referente a localização
class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  bool locationIsLoading = false;

  // Para pegar a localização atual da pessoa
  Future<void> _getUserCurrentLocation() async {
    setState(() {
      locationIsLoading = true;
    });

    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationUtils.generateLocationPreviewImage(
      latitude: locData.latitude!,
      longitude: locData.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
      locationIsLoading = false;
    });

    // print(_previewImageUrl);
  }

  // Para selecionar a localização no mapa
  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => MapScreen()));

    if (selectedLocation == null) {
      return;
    }

    setState(() {
      locationIsLoading = true;
    });

    final staticMapImageUrl = LocationUtils.generateLocationPreviewImage(
      latitude: selectedLocation.latitude!,
      longitude: selectedLocation.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
      locationIsLoading = false;
    });
    // print(selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    final Widget previewImage;

    if (locationIsLoading) {
      previewImage = const CircularProgressIndicator();
    } else if (_previewImageUrl != null) {
      previewImage = Image.network(
        _previewImageUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    } else {
      previewImage = const Text('Nenhuma localização selecionada');
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: previewImage,
        ),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: _getUserCurrentLocation,
                  label: Text('Localição atual'),
                  icon: Icon(Icons.location_on),
                ),
              ),

              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: _selectOnMap,
                  label: Text('Selecione a localização'),
                  icon: Icon(Icons.map),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
