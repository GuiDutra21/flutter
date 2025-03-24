import 'package:flutter/material.dart';
import 'package:great_places/components/image_input.dart';

// Tela de formulário dos lugares
class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final textController = TextEditingController();

  void submitForm() {}

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
                    ImageInput(),
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
