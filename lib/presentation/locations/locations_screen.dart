import 'package:car_rental/presentation/locations/locations_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationsScreen extends StatelessWidget {
  LocationsScreen({Key? key}) : super(key: key);
  final controller = Get.find<LocationsController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Locations"),
      ),
    );
  }
}
