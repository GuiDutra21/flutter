import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) function;

  const Button({
    required this.text,
    this.big = false,
    this.color = DEFAULT,
    required this.function,
    super.key,
  });

  const Button.big({
    required this.text,
    this.big = true,
    this.color = DEFAULT,
    required this.function,
    super.key,
  });

  const Button.operation({
    required this.text,
    this.big = false,
    this.color = OPERATION,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        onPressed: () => function(text),
        
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "San Francisco",
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
