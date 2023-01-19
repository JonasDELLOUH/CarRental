import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/utility/car_carac_card.dart';
import 'package:car_rental/widgets/read_more.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/my_icons.dart';
import '../../models/car.dart';
import '../../utility/car_card.dart';

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
        leading: IconButton(
          icon: MyIcons.leadingIcon(),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
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
              const SizedBox(
                height: 5,
              ),
              Row(
                children: stars(widget.car.nbrStars, size: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
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
              const SizedBox(
                height: 10,
              ),
              richText(text: "overview".tr, fontWeight: FontWeight.w400),
              const SizedBox(
                height: 5,
              ),
              readmore(text: widget.car.overview),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarCaracCard(
                      carac: "${widget.car.carSpeed} km/h",
                      caracIconData: MyIcons.speedIconData(),
                      width: width * 0.15),
                  CarCaracCard(
                      carac: "${widget.car.nbrPlaces} ${'seats'.tr}",
                      caracIconData: MyIcons.seatIconData(),
                      width: width * 0.15),
                  CarCaracCard(
                      carac: widget.car.isReserved
                          ? 'reserved'.tr
                          : 'available'.tr,
                      caracIconData: widget.car.isReserved
                          ? MyIcons.reserveIconData()
                          : MyIcons.availableIconData(),
                      width: width * 0.15)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  richText(text: "${widget.car.rentalPrice*0.3} cfa / ${'day'.tr}", fontSize: 15),
                  InkWell(
                    onTap: (){
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      // width: width * 0.45,
                      decoration: const BoxDecoration(
                          color: ConstColors.blueColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Center(
                        child: richText(
                            text: 'reserve_now'.tr,
                            color: ConstColors.backgroundColor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
