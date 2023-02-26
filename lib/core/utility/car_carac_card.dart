import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/text_widgets.dart';

Widget CarCaracCard({required String carac, required IconData caracIconData, required double width, Color color = ConstColors.blackColor}){
  return Column(
    children: [
      Container(
        height: width,
        width: width,
        decoration:  BoxDecoration(
          color: ConstColors.greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8), bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))
        ),
        child: Center(
          child: Icon(
            caracIconData,size: width/2, color: color,
          ),
        ),
      ),
      SizedBox(height: 1,),
      myText(text: carac, fontSize: 10, fontWeight: FontWeight.bold)
    ],
  );
}