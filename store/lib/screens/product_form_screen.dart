import 'dart:math';

import 'package:flutter/material.dart';

import '../models/product.dart';

// Tela de formulário para quando desejamos criar um novo produto
class ProductFormScreen extends StatefulWidget {
  // Construtor
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {

  // Focos
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController =
      TextEditingController(); // Controller para ter acesso a imagem antes de submeter o formulario

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String,Object>();

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(updateImage);
    // Adicionando o listener no controller a imagem muda em tempo real
    // Agora se adicionarmos o listener no focus, a imgem mudaria apenas quando o focus mudasse
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionFocus.dispose();
    _priceFocus.dispose();
    _imageUrlFocus.dispose();
    _imageUrlController.removeListener(updateImage);
  }

  void updateImage() {
    setState(() {}); // Atualiza a imagem em tempo real enquanto o usuário digita
  }

  void submitForm()
  { 
    final isValid = _formKey.currentState?.validate() ?? false;

    if(!isValid)
    {
      return;
    } // Se não for válido já termina o método

    _formKey.currentState?.save(); // Viabiliza o uso do atributo onSave em cada formulario
    final newProduct = Product(
      id: Random().nextInt(1000).toString(),
      name: _formData['name'].toString(),
      price: _formData['price'] as double,
      description: _formData['description'].toString(),
      imageUrl: _formData['imageUrl'].toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário do Produto"),
        actions: [
          IconButton(onPressed: () => submitForm(), icon:  const Icon(Icons.save, color: Colors.white,),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey, // Essa chave permite termos acesso ao estado e demais dados do formulário 
          child: ListView(
            children: [

              TextFormField(
                decoration: const InputDecoration(labelText: "Nome"),
                textInputAction: TextInputAction
                    .next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                }, // Para passar o foco para o TextFormField com o _pricefocus
                onSaved: (name) => _formData['name'] = name ?? '',

                validator: (name) {
                  final _name = name ?? '';

                  if(_name.trim().isEmpty)
                    return 'O nome não pode ser vazio!'; // mensagem de erro que irá aparecer
                  
                  if(_name.trim().length < 4)
                    return "O nome deve ter pelo menos 3 caracteres";
                  
                  return null; // Retorna null para indicar que está certo
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: "Preço (R\$)"),
                textInputAction: TextInputAction.next, 
                focusNode:
                    _priceFocus, // Referência para onde o foco irá depois de 'clicarmos próximo' no TextFormField anterior
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                }, // Para passar o foco para o TextFormField com o _descriptionFocus
                onSaved: (price) => _formData['price'] = double.parse(price ?? '0'),
              ),
              
              TextFormField(
                decoration: const InputDecoration(labelText: "Descrição"),
                textInputAction: TextInputAction
                    .next, // Para quando clicar no enter ir para o próximo formulário (mas sozinho não faz isso)
                focusNode:
                    _descriptionFocus, // Referência para onde o foco irá depois de 'clicarmos próximo' no TextFormField anterior
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFocus);
                }, // Para passar o foco para o TextFormField com o _imageUrlFocus
                onSaved: (description) => _formData['description'] = description ?? '',
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Url da imagem"),
                      textInputAction: TextInputAction.done,
                      focusNode:
                          _imageUrlFocus, // Referência para onde o foco irá depois de 'clicarmos próximo' no TextFormField anterior
                      controller: _imageUrlController,
                      onSaved: (imageUrl) => _formData['imageUrl'] = imageUrl ?? '',
                      onFieldSubmitted: (_) => submitForm(),
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )
                      ),
                      alignment: Alignment.center,
                      child: _imageUrlController.text.isEmpty
                          ? const Text("Infome a URL")
                          : Image.network(
                            fit: BoxFit.cover,
                            _imageUrlController.text,
                            errorBuilder: (context, error, stackTrace) => const Text("URL inválida", style: TextStyle(color: Colors.red),)
                          )),
                ],
              ),
            ],
        )),
      ),
    );
  }
}