import 'package:car_rental/presentation/splash1/splash1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash1Screen extends GetWidget<Splash1Controller> {
  const Splash1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
