import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget textField(
    {required TextEditingController controller,
    TextInputType textInputType = TextInputType.text,
    String hintText = "", String? Function(String?)? validator}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(border: InputBorder.none, hintText: hintText),
    ),
  );
}
