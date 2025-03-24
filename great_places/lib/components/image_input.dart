import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Componente que representa a imagem e o ícone para tirar foto
class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<StatefulWidget> createState() => _ImageInputState();
}

class _ImageInputState extends State<StatefulWidget> {

  File? _storedImage;

  void _takePhoto() async
  {
    final ImagePicker picker = ImagePicker();
    XFile imageFile =  await picker.pickImage(source: ImageSource.camera, maxHeight: 600) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });
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
  // _takePicture() async {
  //   final ImagePicker _picker = ImagePicker();
  //   XFile imageFile = await _picker.pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 600,
  //   ) as XFile;
 
  //   setState(() {
  //     _storedImage = File(imageFile.path);
  //   });
  // }