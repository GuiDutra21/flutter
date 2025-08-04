import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Componente que representa a foto e o botão de adicionar no começo do formulário de inscrição
class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;

  const UserImagePicker({required this.onImagePick, super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
  // FocusScope.of(context).unfocus(); // Remove o foco de qualquer campo de texto ou input que estiver ativo
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(
    source: source,
    imageQuality: 50,
    maxWidth: 150,
  );

  if (pickedImage != null) {
    setState(() {
      _image = File(pickedImage.path);
    });
    widget.onImagePick(_image!); // CallBack
  }
}

void _showImageSourceOptions() {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Tirar foto'),
            onTap: () {
              Navigator.of(ctx).pop();
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Escolher da galeria'),
            onTap: () {
              Navigator.of(ctx).pop();
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          radius: 40,
        ),
        TextButton.icon(
          onPressed: _showImageSourceOptions,
          label: Text('Adicionar imagem'),
          icon: Icon(Icons.image),
        ),
      ],
    );
  }
}
