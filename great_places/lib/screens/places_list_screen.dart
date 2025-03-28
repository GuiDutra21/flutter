import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Lugares"),
        actions: [
          IconButton(
            onPressed:
                () => Navigator.of(context).pushNamed(AppRoutes.placesForm),
            icon: Icon(Icons.add),
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadProducts(), // Carrega os dados sem reescutar mudanças no provider
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Houve algum erro no carregamento!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator());
          }
          else
          {
            return Consumer<GreatPlaces>( // Cuida da atualização dos dados na interface sem recarregar o FutureBuilder
              child: const Center(child: Text("Nenhum local cadastrado!")),
              builder:
                  (context, greatPlaces, child) =>
                      greatPlaces.itemsCount == 0
                          ? child!
                          : ListView.builder(
                            itemCount: greatPlaces.itemsCount,
                            itemBuilder:
                                (context, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                      greatPlaces.itemByIndex(index).image,
                                    ),
                                  ),
                                  title: Text(
                                    greatPlaces.itemByIndex(index).title,
                                  ),
                                ),
                          ),
            );
          }
        },
      ),
    );
  }
}
