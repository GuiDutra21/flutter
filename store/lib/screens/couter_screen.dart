import 'package:flutter/material.dart';
import 'package:store/providers/counter_provider.dart';

// Classe teste para aprender o uso do inheredtWidget e do provider
class CounterScreen extends StatefulWidget
{
  // Construtor
  const CounterScreen({ super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    
    // Obtem o estado do provider/InheritedWidget
    var state1 = CounterProvider.of(context)!.state;
    var state2 = CounterProvider.of(context)!.state;

    // OBS: O state1 e o state2 são o mesmo estado,
    // tanto que lá embaixo estou mostrando na tela os dois e o valor é sempre o mesmo

    return Scaffold(
      appBar: AppBar(
        title: const Text("teste InheritedWidget"),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [ 
            Text(state1.value.toString()),
            IconButton(icon: const Icon(Icons.add), onPressed: () {setState (() {state1.inc();});},),
            IconButton(icon: const Icon(Icons.remove), onPressed: () {setState (() {state2.dec();});},),
            Text(state2.value.toString()),
          ]
        ),
      ),
    );
  }
}