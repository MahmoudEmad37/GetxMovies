import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final String? fontFamily;

  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.fontWeight = FontWeight.w300,
    this.color = Colors.black,
    this.fontSize = 22,
    this.overflow,
    this.textDirection,
    this.height,
    this.textAlign = TextAlign.start,
    this.textDecoration,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      textDirection: textDirection,
      style: style ??
          TextStyle(
            fontFamily: fontFamily,
            decoration: textDecoration,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            height: height,
            decorationColor: color,
            decorationThickness: 1.5,
          ),
    );
  }
}
