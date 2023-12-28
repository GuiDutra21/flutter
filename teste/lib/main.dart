import 'package:flutter/material.dart';

/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("ola"), centerTitle: true),
        body: const Text("mais uma vez ola!"),
          floatingActionButton:  const Botao(),
    ),
    );
  }
}

class Botao extends StatelessWidget {
  const Botao({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context,
           builder: (BuildContext context){
              return SizedBox(
                  height: 250,
                  child: ElevatedButton(
                    child: const Text("fechar Modal"),
                    onPressed: () => Navigator.pop(context),
                  ),
              );
           }
          );
        },
      );
  }
}
