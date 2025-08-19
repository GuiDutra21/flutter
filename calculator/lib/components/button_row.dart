import 'package:flutter/material.dart';
import 'button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;
  const ButtonRow({required this.buttons, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, button) {
          if (list.isEmpty) {
            list.add(button);
          } else {
            list.add(SizedBox(width: 1));
            list.add(button);
          }
          return list;
        }),
      ),
    );
  }
}
