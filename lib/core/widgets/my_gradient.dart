import 'package:flutter/material.dart';

class MyGradient extends BoxDecoration {
  MyGradient(
      {required Color startColor,
      required Color endColor,
      bool horizontal = false,
      double radius = 0})
      : super(
            gradient: LinearGradient(
                colors: [startColor, endColor],
                begin: const FractionalOffset(0, 0),
                end: (horizontal)
                    ? const FractionalOffset(1, 0)
                    : const FractionalOffset(0, 1)),
            borderRadius: BorderRadius.all(Radius.circular(radius)));
}
