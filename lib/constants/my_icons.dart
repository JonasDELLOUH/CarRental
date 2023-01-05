import 'package:car_rental/constants/colors.dart';
import 'package:flutter/material.dart';

class MyIcons {
  static Icon searchIcon(
          {double size = 20, Color color = ConstColors.whiteColor}) =>
      Icon(
        Icons.search,
        size: size,
        color: color,
      );

  static Icon starIcon(
          {double size = 20, Color color = ConstColors.whiteColor}) =>
      Icon(
        Icons.star,
        size: size,
        color: color,
      );

  static Icon directionsCarFilled(
          {double size = 20, Color color = ConstColors.whiteColor}) =>
      Icon(
        Icons.directions_car_filled,
        size: size,
        color: color,
      );

  static Icon attachMoney(
          {double size = 20, Color color = ConstColors.whiteColor}) =>
      Icon(
        Icons.attach_money,
        size: size,
        color: color,
      );
}
