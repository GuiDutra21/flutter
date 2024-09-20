import 'package:flutter/material.dart';
// Classe teste para aprender o uso do provider e do InheritedWidget
// Representa um estado qualquer 
class CounterState 
{
  int _value = 0;

  void inc () => _value++;
  void dec () => _value--;
  int get value => _value;

  bool diff(CounterState old)
  {
    return old._value != _value;
  }
}

// Classe teste para aprender o uso do provider e do InheritedWidget.
// Representa o próprio Provider
class CounterProvider extends InheritedWidget
{ 
  // Obtem o estado/ cria o estado
  // Aqui estamos apenas criando uma instância da classe ali de cima
  final CounterState state = CounterState();

  // Apenas o construtor
  CounterProvider({super.key, required super.child});

  // Necessário para fornecer a instância do provider para outros locais da aplicação
  // Aqui que faz funcionar o ...of(context)... 
  static CounterProvider? of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType();
  }
  
  // Função que permite a alteração do estado("notifica") se a função for true
  // Se for false não ocorre mudança no estado
  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}