import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/constants/my_icons.dart';
import 'package:car_rental/models/car_brand.dart';
import 'package:car_rental/providers/firestore_provider.dart';
import 'package:car_rental/screens/car_details.dart';
import 'package:car_rental/screens/search_page.dart';
import 'package:car_rental/services/car_brand_services.dart';
import 'package:car_rental/services/car_services.dart';
import 'package:car_rental/utility/car_brand_card.dart';
import 'package:car_rental/utility/car_card.dart';
import 'package:car_rental/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirestoreProvider firestorePro = Provider.of<FirestoreProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text("RENTALCAR"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.17,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: ConstColors.backgroundColor,
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(25)),
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
                    const SizedBox(
                      height: 10,
                    ),
                    richText(text: 'home_express2'.tr, fontSize: 15),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: ConstColors.primaryColor.withOpacity(0.4),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(25),
                            left: Radius.circular(25)),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                        },
                        child: Row(
                          children: [
                            MyIcons.searchIcon(size: 30),
                            const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              myText(text: 'best_brand'.tr, fontWeight: FontWeight.bold),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: height * 0.09,
                child: StreamBuilder<List<CarBrand>>(
                  stream: carBrandService.getCarBrands(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CarBrand>> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    if (snapshot.hasData) {}

                    carBrands = snapshot.data!;
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
                child: firestorePro.firestoreStatus == FirestoreStatus.getting
                    ? const CircularProgressIndicator()
                    : StreamBuilder<List<Car>>(
                        // stream: carServices.getCollectionStream(),
                        stream: carServices.getCars(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Car>> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text("Loading");
                          }
                          if (snapshot.hasData) {}
                          cars = snapshot.data!;
                          print(firestorePro.firestoreStatus);
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (orientation == Orientation.portrait)
                                            ? 2
                                            : 3,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
