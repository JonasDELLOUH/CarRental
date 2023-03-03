import 'package:car_rental/presentation/splash2/splash2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class Splash2Screen extends StatelessWidget {
  Splash2Screen({Key? key}) : super(key: key);
  final controller = Get.find<Splash2Controller>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            child: Image.asset(
              Assets.imagesLogo1,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
