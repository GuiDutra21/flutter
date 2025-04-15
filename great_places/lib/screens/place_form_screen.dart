import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/components/location_input.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:flutter/material.dart';
import 'package:great_places/components/image_input.dart';
import 'package:provider/provider.dart';

// Tela de formulário dos lugares
class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final textController = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }
  
  void _selectPosition(LatLng pickedPosition) {
    setState(() {
      _pickedPosition = pickedPosition;
    });
  }

  bool _isvalidForm()
  {
    return textController.text.isNotEmpty && _pickedImage != null && _pickedPosition != null;
  }


  void submitForm() {
    if (!_isvalidForm()) return;

    Provider.of<GreatPlaces>(
      context,
      listen: false,
    ).addPlace(textController.text, _pickedImage!, _pickedPosition!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Lugar")),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: textController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "Titulo",
                        enabledBorder: UnderlineInputBorder(
                          // Linha quando NÃO está em foco
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      onChanged: (text)
                      {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    ImageInput(_selectImage),
                    SizedBox(height: 20),
                    LocationInput(onSelectPosition: _selectPosition),
                  ],
                ),
              ),
            ),
          ),

          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Adicionar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              iconColor: Colors.black,
              foregroundColor: Colors.black,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius
                        .zero, // Para deixar o botão num formato retangular
              ),
            ),
            onPressed: _isvalidForm() ? submitForm : null,
          ),
        ],
      ),
    );
  }
}
