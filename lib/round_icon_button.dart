import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.pressedCallback});

  final IconData icon;
  final Function pressedCallback;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: pressedCallback,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor( // Copy from floating_action_button.dart
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4E5E),
    );
  }
}