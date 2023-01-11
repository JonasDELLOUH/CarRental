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

  static Icon leadingIcon(
          {double size = 30, Color color = ConstColors.blackColor}) =>
      Icon(
        Icons.keyboard_backspace,
        size: size,
        color: color,
      );

  static Icon homeIcon(
          {double size = 30, Color color = ConstColors.blackColor}) =>
      Icon(
        Icons.home,
        size: size,
        color: color,
      );

  static Icon notificationIcon(
          {double size = 30, Color color = ConstColors.blackColor}) =>
      Icon(
        Icons.notifications,
        size: size,
        color: color,
      );

  static Icon settingIcon(
          {double size = 30, Color color = ConstColors.blackColor}) =>
      Icon(
        Icons.settings,
        size: size,
        color: color,
      );

  static Icon carIcon(
          {double size = 30, Color color = ConstColors.blackColor}) =>
      Icon(
        Icons.directions_car_filled,
        size: size,
        color: color,
      );

  static IconData homeIconData() => Icons.home;

  static IconData notificationIconData() => Icons.notifications;

  static IconData settingIconData() => Icons.settings;

  static IconData carIconData() => Icons.directions_car_filled;

  static IconData speedIconData() => Icons.speed;

  static IconData seatIconData() => Icons.chair_alt;

  static IconData reserveIconData() => Icons.lock;

  static IconData availableIconData() => Icons.lock_open;

  static IconData carBrandIconData() => Icons.garage;

  static IconData moneyIconData() => Icons.attach_money;
}
