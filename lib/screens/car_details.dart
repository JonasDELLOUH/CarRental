import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/my_icons.dart';
import '../models/car.dart';
import '../utility/car_card.dart';

class CarDetails extends StatefulWidget {
  final Car car;

  const CarDetails({Key? key, required this.car}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        leading: MyIcons.leadingIcon(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              richText(
                  text:
                      "${widget.car.carBrand.carBrandName} ${widget.car.carModel}",
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 5,
              ),
              Row(
                children: stars(widget.car.nbrStars, size: 25),
              ),
              SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Image.network(
                  widget.car.carImageUrl,
                  height: width * 0.7,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              richText(text: "overview".tr, fontWeight: FontWeight.w400),
              SizedBox(height: 5,),
              
            ],
          ),
        ),
      ),
    );
  }
}
