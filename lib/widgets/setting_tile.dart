import 'package:car_rental/widgets/custom_text.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget settingTile(
    {required String title,
    required String subTitle,
    required IconData iconData}) {
  return Container(
    height: 60,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: Center(
              child: Icon(iconData, size: 40,),
            )),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              richText(
                text: title,
              ),
              CustomText(text: subTitle, fontSize: 15, color: ConstColors.primaryColor.withOpacity(0.7),)
            ],
          ),
        )
      ],
    ),
  );
}
