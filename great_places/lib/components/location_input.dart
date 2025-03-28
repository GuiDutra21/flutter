import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    String? _previewImageUrl;

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child:
              _previewImageUrl == null
                  ? Text('Nenhuma localização selecionada')
                  : Image.network(
                    _previewImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
        ),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Localição atual'),
                  icon: Icon(Icons.location_on),
                ),
              ),
            
              Container(
              margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: () {},
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
