import 'dart:io';
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

  void _selectImage(File pickedImage)
  {
    _pickedImage = pickedImage;
  }
  void submitForm() {
    if(textController.text.isEmpty || _pickedImage == null )
      return;

    Provider.of<GreatPlaces>(context, listen: false).addPlace(textController.text, _pickedImage!);
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
                      cursorColor: Colors.black,
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: "Titulo",
                        enabledBorder: UnderlineInputBorder( // Linha quando NÃO está em foco
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ), 
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ImageInput(_selectImage),
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
            onPressed: submitForm,
          ),
        ],
      ),
    );
  }
}
