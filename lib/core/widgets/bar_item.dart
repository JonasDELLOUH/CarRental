import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../constants/colors.dart';

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
