import 'package:flutter/material.dart';

class CounterState
{
  int _value = 0;
  void inc() => _value++;
  void dec() => _value--;
  int get value => _value;
}
// Classe usada como teste para aprender a utilização de um provider e do inheritedWidget
class CounterProvider extends InheritedWidget
{
  final CounterState state = CounterState();

   CounterProvider({super.key, required Widget child}) : super(child: child);

   static CounterProvider? of(BuildContext context)
   {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
   }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget )
  {
    return true;
  }

}