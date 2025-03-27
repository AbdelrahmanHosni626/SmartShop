import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;

  const AppText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
        color: color,
      ),
    );
  }
}
