import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;

  const CustomText(
      {@required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.textOverflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: textOverflow,
        style: GoogleFonts.getFont('Lato',
            fontSize: fontSize, color: color, fontWeight: fontWeight));
  }
}
