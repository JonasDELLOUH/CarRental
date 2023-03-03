
import '../models/car_brand.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widgets.dart';

Widget CarBrandCard({required CarBrand carBrand, required double height, void Function()? onTap}) {
  return InkWell(
    onTap: () {
      onTap;
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5)),
            child: Image.network(
          carBrand.carBrandImageUrl,
          height: height * 0.6,
          width: height * 0.7,
          fit: BoxFit.cover,
        )),
        myText(text: carBrand.carBrandName, fontSize: height * 0.18)
      ],
    ),
  );
}
