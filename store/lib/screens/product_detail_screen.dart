import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

// Classe que representa a tela de detalhe de um produto
class ProductDetailScreen extends StatelessWidget {
  // Construtor
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Maneira diferente de receber o produto, não precisa passar via construtor
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(product.name),
      // ),

      body: CustomScrollView(
        // Se necessário deixa a tela rolável
        slivers: [
          SliverAppBar(
            // foregroundColor: Colors.blue,

            expandedHeight: 300,
            pinned: true,
            leading: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87, // Cor da sombra
                    blurRadius: 8, // Nível do desfoque
                    spreadRadius: -20, // Espalhamento da sombra
                    offset: Offset(0, 0), // Posição da sombra
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white, // Cor do ícone
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                product.name,
                style: const TextStyle(color: Colors.white),
                // textAlign: TextAlign.center,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: product.id,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Para gerar uma leve "sombra" atrás do texto da imagem
                  const DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0, 0.7),
                              end: Alignment(0, 0),
                              colors: [
                        Color.fromRGBO(0, 0, 0, 0.6),
                        Color.fromRGBO(0, 0, 0, 0),
                      ])))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              // Apenas para dar espaço entre a imagem e o valor
              height: 10,
            ),

            Text(
              "R\$ ${product.price}",
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ), // Preço

            Padding(
                // Descrição do produto
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Text(
                  product.description,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),

            // Apenas para fazer a tela ficar rolável e o efeito FlexibleSpaceBar aparecer
            const SizedBox(
              height: 1000,
            ),
          ]))
        ],
      ),
    );

// return Scaffold(
//       appBar: AppBar(
//         title: Text(product.name),
//       ),

//       body: SingleChildScrollView( // Se necessário deixa a tela rolável
//         child: Column(
//           children: [

//            Padding(
//               padding: const EdgeInsets.fromLTRB(17, 25, 17, 10),
//               child: ClipRRect( // Aplica a borda arredondada
//                 borderRadius: BorderRadius.circular(30),
//                 child: AspectRatio( // Mantém a proporção da imagem
//                   aspectRatio: 1 / 1,
//                   child: Hero(
//                     tag: product.id,
//                     child: Image.network(
//                       product.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox( // Apenas para dar espaço entre a imagem e o valor
//               height: 10,
//             ),

//             Text("R\$ ${product.price}", style: const TextStyle(fontSize: 20)), // Preço

//             Padding( // Descrição do produto
//                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//                 child: Text(
//                   product.description,
//                   style: const TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 )),
//           ],
//         ),
//       ),
//     );
  }
}
