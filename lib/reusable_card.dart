import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.color, this.cardChild, this.itemSelected});

  final Color color;
  final Widget cardChild;
  final Function itemSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemSelected,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}