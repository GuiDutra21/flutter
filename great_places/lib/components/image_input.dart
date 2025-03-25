import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// Componente que representa a imagem e o ícone para tirar foto
class ImageInput extends StatefulWidget {

  final Function(File) onSelectImage;
  const ImageInput(this.onSelectImage,{super.key});

  @override
  State<StatefulWidget> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File? _storedImage;

  void _takePhoto() async
  {
    final ImagePicker picker = ImagePicker();
    XFile imageFile =  await picker.pickImage(source: ImageSource.camera, maxHeight: 600) as XFile;
    
    setState(() {
      _storedImage = File(imageFile.path);
    });


    final appDir = await getApplicationDocumentsDirectory(); // Pega o diretorio do app
    String fileName = basename(_storedImage!.path); // Pega o nome da imagem
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName'); // Copia a imagem para o diretório de documentos do app

    widget.onSelectImage(savedImage); // Passa para a callBack
  }

  @override
  Widget build(BuildContext contex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null ? 
          Image.file(
            _storedImage!,
            width: double.infinity,
            fit: BoxFit.cover,
          )
          : Text("Nenhuma imagem!"),
        ),
        Spacer(flex: 1,), // Para centralizar o butao no lado direito
        TextButton.icon(
          onPressed: _takePhoto,
          label: Text("Tirar foto"),
          icon: Icon(
            Icons.camera,
          ),
        ),
        Spacer(flex: 1,) // Para centralizar o butao no lado direito
      ],
    );
  }
}