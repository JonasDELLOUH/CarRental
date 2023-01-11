import 'package:car_rental/constants/colors.dart';
import 'package:flutter/material.dart';

class BarItem extends IconButton {
  BarItem(
      {super.key,
      required VoidCallback onPressed,
      required IconData iconData,
      required bool selected,
      double size = 30})
      : super(
          icon: Icon(
            iconData,
            color: selected ? ConstColors.blueColor : ConstColors.primaryColor,
            size: size,
          ),
          onPressed: onPressed,
        );
}
