import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final bool isBorder;
  CustomButton({
    super.key,
    required this.text,
    this.width = 200,
    this.color = Colors.red,
    this.textColor = Colors.white,
    this.isBorder = false,
    this.borderColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
          border: isBorder ? Border.all(width: 2, color: borderColor) : null),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
