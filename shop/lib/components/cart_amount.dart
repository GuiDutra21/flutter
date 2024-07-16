import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartAmount extends StatelessWidget
{ 
  late Widget child;
  late String value;
  Color? color;

  CartAmount({super.key, required this.child, required this.value, this.color});

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 6,
          top: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).focusColor,
            ),
            constraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            alignment: Alignment.center,
            padding: const  EdgeInsets.all(2),
            child: Text(value, style: const TextStyle(fontSize: 10, color: Colors.black),),
          ),
        )
        // Container(
        //   decoration: BoxDecoration(
        //     border: BorderRadius.circular()
        //   ),
        // )
      ],
    );
  }
}