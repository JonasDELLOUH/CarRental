import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/constants/my_icons.dart';
import 'package:car_rental/models/car_brand.dart';
import 'package:car_rental/services/car_brand_services.dart';
import 'package:car_rental/services/car_services.dart';
import 'package:car_rental/utility/car_brand_card.dart';
import 'package:car_rental/utility/car_card.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/car.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarServices carServices = CarServices();
  CarBrandService carBrandService = CarBrandService();
  Car? car;
  List<Car> cars = [];
  List<CarBrand> carBrands = [];

  Future<void> nn(snapshot) async {
    cars = await Car.toList(snapshot);
  }

  Future<void> nn1(snapshot) async {
    carBrands = await CarBrand.toList(snapshot);
  }

  void mm(snapshot) async {
    car = await Car.fromMap(snapshot);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text("RENTALCAR"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: height * 0.17,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ConstColors.backgroundColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: ConstColors.primaryColor.withOpacity(0.3),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 1,
                    ),
                  ]),
              child: Column(
                children: [
                  richText(
                      text: 'home_express1'.tr,
                      color: ConstColors.blueColor,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 10,
                  ),
                  richText(text: 'home_express2'.tr, fontSize: 15),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: ConstColors.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(25),
                          left: Radius.circular(25)),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          MyIcons.searchIcon(size: 30),
                          SizedBox(
                            width: 10,
                          ),
                          myText(
                              text: 'search'.tr,
                              color: ConstColors.whiteColor.withOpacity(0.7))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            myText(text: 'best_brand'.tr, fontWeight: FontWeight.bold),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height * 0.09,
              child: StreamBuilder<QuerySnapshot>(
                stream: carBrandService.getCollectionStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if (snapshot.hasData) {}

                  nn1(snapshot);
                  return VxSwiper.builder(
                    itemCount: carBrands.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print("Les categories : ${jobCategories}");
                      return CarBrandCard(
                          carBrand: carBrands[index], height: height * 0.1);
                    },
                    height: height * 0.1,
                    viewportFraction: 0.2,
                    autoPlay: true,
                    autoPlayAnimationDuration: 3.seconds,
                    autoPlayCurve: Curves.linear,
                    enableInfiniteScroll: true,
                  );
                },
              ),
            ),
            Container(
              height: height * 0.51,
              // color: Colors.blue,
              child: StreamBuilder<QuerySnapshot>(
                stream: carServices.getCollectionStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if (snapshot.hasData) {}
                  nn(snapshot);
                  print(cars.length);
                  print("Voici la taille");
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 3, childAspectRatio: 0.75),
                    itemBuilder: (BuildContext context, index) {
                      return CarCard(car: cars[index], height: height * 0.51);
                    },
                    itemCount: cars.length,
                    shrinkWrap: true,

                  );
                },
              ),
            )
            // Container(
            //   height: height * 0.5,
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: carServices.getCollectionStream(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (snapshot.hasError) {
            //         return const Text('Something went wrong');
            //       }
            //
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Text("Loading");
            //       }
            //       if (snapshot.hasData) {}
            //       nn(snapshot);
            //
            //       // print("voici le snapshot : ${snapshot.data}");
            //
            //       // addressList = Address.toList(snapshot);
            //
            //       return ListView.builder(
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(cars[index].carModel),
            //             subtitle: Image.network(cars[index].carImageUrl),
            //           );
            //         },
            //         itemCount: cars.length,
            //       );
            //       return Text(car!.carModel);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
