import 'package:car_rental/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Widget myText(
    {required String text,
    Color color = ConstColors.primaryColor,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.center}) {
  return Text(
    text,
    style: GoogleFonts.robotoSlab(
      textStyle:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    ),
    textAlign: textAlign,
  );
}

Widget richText(
    {required String text,
    Color color = ConstColors.primaryColor,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.normal}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: text,
      style: GoogleFonts.robotoSlab(
        textStyle:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
      children: const <TextSpan>[
        // TextSpan(text: text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: color)),
      ],
    ),
  );
}
