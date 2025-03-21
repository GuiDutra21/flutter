import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_list.dart';

import '../models/product.dart';

// Tela de formulário para quando desejamos criar um novo produto
class ProductFormScreen extends StatefulWidget {

  // Construtor
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  
  bool isLoading = false;
  
  // Focos
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController =
      TextEditingController(); // Controller para ter acesso a imagem antes de submeter o formulario

  final _formKey = GlobalKey<FormState>(); // Permite acessar e modificar o estado do formulário
  final _formData = <String, Object>{};

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(updateImage);
    // Adicionando o listener no controller a imagem muda em tempo real
    // Agora se adicionarmos o listener no focus, a imagem mudaria apenas quando o focus mudasse
  }

  // é chamado sempre que as dependências do objeto State mudam
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
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
    setState(
        () {}); // Atualiza a imagem em tempo real enquanto o usuário digita
  }

  bool isUrlValid(String url) {
    final isValid = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    final endsWith = url.toLowerCase().endsWith('.png') ||
        url.endsWith('.jpeg') ||
        url.endsWith('.jpg');
    return isValid && endsWith;
  }
  
  Future<void> submitForm() async {

    final isValid = _formKey.currentState?.validate() ?? false; // Percorre todos os campos do Form e executa os validator definidos

    if (!isValid) {
      return;
    } // Se não for válido já termina o método

    setState(() => isLoading = true);

    _formKey.currentState
        ?.save(); // Viabiliza o uso do atributo onSave em cada formulario

    try {
      await Provider.of<ProductList>(context, listen: false)
          .saveProduct(_formData);

      // Somente executa essa linha se o try der certo
      Navigator.of(context).pop();
    } catch (error) {

       await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Colors.amber,
                title: const Text("Ocorreu um erro!"),
                content: const Text("Não foi possível salvar o produto"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("OK"))
                ],
              ));
    }finally{ 
      // Mesmo se houver erro o finally depois é executado, ou seja, ele sempre é executado
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário do Produto"),
        actions: [
          IconButton(
            onPressed: () => submitForm(),
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                  key:
                      _formKey, // Essa chave permite termos acesso ao estado e demais dados do formulário
                  child: ListView(
                    children: [

                      TextFormField(
                        initialValue: _formData['name']?.toString(),
                        decoration: const InputDecoration(labelText: "Nome"),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocus);
                        }, // Para passar o foco para o TextFormField com o _pricefocus
                        onSaved: (name) => _formData['name'] = name ?? '',

                        validator: (name) {
                          final _name = name ?? '';
                          if (_name.trim().isEmpty)
                            return 'O nome não pode ser vazio!'; // mensagem de erro que irá aparecer

                          if (_name.trim().length < 3)
                            return "O nome deve ter pelo menos 3 caracteres";

                          return null; // Retorna null para indicar que está certo
                        },
                      ),

                      TextFormField(
                        initialValue: _formData['price']?.toString(),
                        decoration:
                            const InputDecoration(labelText: "Preço (R\$)"),
                        textInputAction: TextInputAction.next,
                        focusNode:
                            _priceFocus, // Vincula o _priceFocus a esse TextFormField
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_descriptionFocus);
                        }, // Para passar o foco para o TextFormField com o _descriptionFocus
                        onSaved: (price) =>
                            _formData['price'] = double.parse(price ?? '0'),
                        validator: (price) {
                          final priceString = price ?? '';
                          final _price = double.tryParse(priceString) ?? -1;

                          if (_price <= 0) return 'Informe um preço válido!';

                          return null;
                        },
                      ),

                      TextFormField(
                          initialValue: _formData['description']?.toString(),
                          decoration:
                              const InputDecoration(labelText: "Descrição"),
                          textInputAction: TextInputAction
                              .next, // Para quando clicar no enter ir para o próximo formulário (mas sozinho não faz isso)
                          focusNode:
                              _descriptionFocus, // Vincula o _descriptionFocus a esse TextFormField
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_imageUrlFocus);
                          }, // Para passar o foco para o TextFormField com o _imageUrlFocus
                          onSaved: (description) =>
                              _formData['description'] = description ?? '',
                          validator: (description) {
                            final _description = description ?? '';

                            if (_description.isEmpty)
                              return "A descrição não pode ser vazia!";

                            if (_description.trim().length < 10)
                              return "A descrição deve ter pelo menos de 10 letras";

                            return null;
                          }
                        ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Url da imagem"),
                              textInputAction: TextInputAction.done,
                              focusNode:
                                  _imageUrlFocus, // Vincula o _imageUrlFocus a esse TextFormField
                              controller: _imageUrlController,
                              onSaved: (imageUrl) =>
                                  _formData['imageUrl'] = imageUrl ?? '',
                              onFieldSubmitted: (_) => submitForm(),
                              validator: (imageUrl) {
                                final _imageUrl = imageUrl ?? '';

                                if (!isUrlValid(_imageUrl))
                                  return 'Informe uma URL válida!';

                                return null;
                              },
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
                              )),
                              alignment: Alignment.center,
                              child: _imageUrlController.text.isEmpty
                                  ? const Text("Infome a URL")
                                  : Image.network(
                                      fit: BoxFit.cover,
                                      _imageUrlController.text,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          const Text(
                                            "URL inválida",
                                            style: TextStyle(color: Colors.red),
                                          ))),
                        ],
                      ),
                    ],
                  )),
            ),
    );
  }
}