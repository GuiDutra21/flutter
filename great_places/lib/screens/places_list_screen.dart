import 'package:flutter/material.dart';
import 'package:great_places/utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget{

  const PlacesListScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Lugares"),
        actions: [
          IconButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.placesForm), icon: Icon(Icons.add))
        ],
        centerTitle: true,
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}