import 'package:car_rental/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_search_bar/wp_search_bar.dart';

import '../constants/my_icons.dart';
import '../models/car.dart';
import '../services/car_services.dart';
import '../utility/car_card.dart';
import 'car_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Car> cars = [];
  CarServices carServices = CarServices();
  late int choice;
  String values = "";

  @override
  void initState() {
    choice = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WPSearchBar(
        appBarBackgroundColor: ConstColors.blueColor,
        listOfFilters: {
          'model': {
            'name': 'model',
            'selected': false,
            'title': 'Model',
            'icon': MyIcons.carIconData(),
            'operation': 'CONTAINS'
          },
          'brand': {
            'name': 'brand',
            'selected': false,
            'title': 'brand'.tr,
            'icon': MyIcons.carBrandIconData(),
            'operation': 'CONTAINS'
          },
          'nb_places': {
            'name': "nb_places",
            'selected': false,
            'title': 'Places ',
            'icon': MyIcons.seatIconData(),
            'operation': 'CONTAINS'
          },
          'price': {
            'name': "price",
            'selected': false,
            'title': '> Price ',
            'icon': MyIcons.moneyIconData(),
            'operation': 'CONTAINS'
          }
        },
        materialDesign: {
          'title': {'text': "${'car'.tr}s"}
        },
        onSearch: (filter, value, operation) {
          setState(() {
            if (filter == 'model') {
              print("choice ...1");
              choice = 1;
              values = value!;
            }

            if (filter == 'brand') {
              choice = 2;
              values = value!;
            }

            if (filter == 'nb_places') {
              choice = 3;
              values = value!;
            }

            if (filter == 'price') {
              choice = 4;
              values = value!;
            }
          });
          print(choice);
          print("voici la value : $value");
        },
        body: Container(
          margin: const EdgeInsets.all(15),
          child: StreamBuilder<List<Car>>(
            // stream: carServices.getCollectionStream(),
            stream: choice == 1
                ? carServices.getCarsWithFilter(model: values)
                : choice == 2
                    ? carServices.getCarsWithFilter(brand: values)
                    : choice == 3
                        ? carServices.getCarsWithFilter(
                            places: int.parse(values))
                        : choice == 4
                            ? carServices.getCarsWithFilter(
                                price: double.parse(values))
                            : carServices.getCars(),
            builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              if (snapshot.hasData) {}
              cars = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3,
                    childAspectRatio: 0.75),
                itemBuilder: (BuildContext context, index) {
                  return CarCard(
                      car: cars[index],
                      height: height * 0.51,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CarDetails(car: cars[index])));
                      });
                },
                itemCount: cars.length,
                shrinkWrap: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
