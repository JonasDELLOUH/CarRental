import 'package:car_rental/constants/const_strings.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

Widget textField({
  required TextEditingController controller, TextInputType textInputType = TextInputType.text, String hintText = ""
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText
      ),
    ),
  );
}
