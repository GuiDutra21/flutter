import 'package:flutter/material.dart';
import 'package:shop/providers/couter-provider.dart';

// Classe usada como teste para aprender a utilização de um provider
class CounterScreen extends StatefulWidget {
  // Construtor
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo contador'),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
              icon: const Icon(Icons.add),
              color: Colors.amber,
              onPressed: () {
                setState(() {
                CounterProvider.of(context)?.state.inc();
                });
              }),
          IconButton(
            icon: const Icon(Icons.remove),
            color: Colors.amber,
            onPressed: () {
              setState(() {
              CounterProvider.of(context)?.state.dec();
              });
            },
          )
        ],
      ),
    );
  }
}
