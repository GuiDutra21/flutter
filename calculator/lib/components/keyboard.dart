import 'package:calculator/components/button.dart';
import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  
  final void Function(String) function;

  const Keyboard({required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          ButtonRow(
            buttons: [
              Button.big(text: 'AC',color: Button.DARK, function: function,),
              Button(text: '%', color: Button.DARK, function: function,),
              Button.operation(text: '/', function: function,),
            ],
          ),
          SizedBox(height: 1,),
          ButtonRow(
            buttons: [
              Button(text: '7', function: function,),
              Button(text: '8', function: function,),
              Button(text: '9', function: function,),
              Button.operation(text: 'x', function: function,),
            ],
          ),
          SizedBox(height: 1,),
          ButtonRow(
            buttons: [
              Button(text: '4', function: function,),
              Button(text: '5', function: function,),
              Button(text: '6', function: function,),
              Button.operation(text: '-', function: function,),
            ],
          ),
          SizedBox(height: 1,),
          ButtonRow(
            buttons: [
              Button(text: '1', function: function,),
              Button(text: '2', function: function,),
              Button(text: '3', function: function,),
              Button.operation(text: '+', function: function,),
            ],
          ),
          SizedBox(height: 1,),
          ButtonRow(
            buttons: [
              Button.big(text: '0', function: function,),
              Button(text: '.', function: function,),
              Button.operation(text: '=', function: function,),
            ],
          ),
        ],
      ),
    );
  }
}
