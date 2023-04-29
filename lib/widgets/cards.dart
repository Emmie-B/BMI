import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  Contain({required this.color, this.cardChild, this.onPress});
  final Color? color;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 200,
        // width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        child: cardChild,
      ),
    );
  }
}
