
import 'package:car_rental/widgets/text_widgets.dart';

import '../models/car_brand.dart';
import 'package:flutter/material.dart';

Widget CarBrandCard({required CarBrand carBrand, required double height}){
  return InkWell(
    onTap: (){

    },
    child: Container(
      width: height,
      // height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(carBrand.carBrandImageUrl, height: height*0.6, width: height*0.7, fit: BoxFit.cover,),
          richText(text: carBrand.carBrandName, fontSize: height*0.18)
        ],
      ),
    ),
  );
}