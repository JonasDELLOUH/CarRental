import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../constants/colors.dart';

Widget readmore(
    {required String text,
    FontWeight fontWeight = FontWeight.normal,
    Color color = ConstColors.primaryColor,
    Color colorClickableText = ConstColors.goldenColor,
    double fontSize = 15,
    }) {
  return ReadMoreText(
    text,
    trimLines: 1,
    preDataText: "",
    preDataTextStyle: GoogleFonts.robotoSlab(
      textStyle:
      TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    ),
    style: GoogleFonts.robotoSlab(
      textStyle:
      TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    ),
    colorClickableText: colorClickableText,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'read_more'.tr,
    trimExpandedText: 'read_less'.tr,
  );
}
