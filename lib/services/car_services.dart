import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/services/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car.dart';
import 'car_brand_services.dart';

class CarServices extends BaseServices {
  CarServices() {
    super.collectionName = FirestoreConstants.car;
  }

  static final firestoreInstance = FirebaseFirestore.instance;

  // final MainController _mainController = Get.find();
  

  Future<List<Car>> getCars() async {
    List<Car> carList = [Car.defaultCar()];
    try{
      QuerySnapshot querySnapshot =
          await firestoreInstance.collection(collectionName).get();
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;

        CarBrandService carBrandService = CarBrandService();
        Map<String, dynamic>? map = {};
        map = await carBrandService.getDataToMap(
            document: data[FirestoreConstants.carBrand]);
        data[FirestoreConstants.carBrand] = map;
        Car car = Car.basicFromMap(data);
        carList.add(car);
      }
    } catch(e, strace){
      print("Voici l'erreur : $e");
      print("Voici le strace : $strace");
    }
    // _mainController.defaultCarList.value = carList;
    return carList;
  }

  Stream<List<Car>> getCarsStream() =>  Stream.periodic(const Duration(seconds: 5)).asyncMap((event) => getCars());

  Future<List<Car>> getCarsWithFilter({String model = "",
    String brand = "",
    String price = "",
    String places = ""}) async {
    List<Car> carList = [];
    QuerySnapshot querySnapshot;
    print("yesssssss voici model : $model");
    if (model.isNotEmpty) {
      print("model is not empty");
      querySnapshot = await firestoreInstance
          .collection(collectionName)
          .where(FirestoreConstants.carModel, isEqualTo: model)
          .get();
    }
    // if(brand.isNotEmpty){
    //   querySnapshot =
    //   await firestoreInstance.collection(collectionName).where(FirestoreConstants.carBrandName, arrayContains: "v").get();
    // }
    else if (places.isNotEmpty) {
      querySnapshot = await firestoreInstance
          .collection(collectionName)
          .where(FirestoreConstants.nbrPlaces,
          isGreaterThanOrEqualTo: int.parse(places))
          .get();
    } else if (price.isNotEmpty) {
      querySnapshot = await firestoreInstance
          .collection(collectionName)
          .where(FirestoreConstants.rentalPrice,
          isLessThanOrEqualTo: double.parse(price))
          .get();
    } else {
      querySnapshot = await firestoreInstance.collection(collectionName).get();
    }

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
      documentSnapshot.data()! as Map<String, dynamic>;

      CarBrandService carBrandService = CarBrandService();
      Map<String, dynamic>? map = {};
      map = await carBrandService.getDataToMap(
          document: data[FirestoreConstants.carBrand]);
      data[FirestoreConstants.carBrand] = map;
      Car car = Car.basicFromMap(data);
      carList.add(car);
    }
    return carList;
  }

  Stream<List<Car>> getCarsWithFilterStream({String model = "", String brand = "",
    String price = "",
    String places = ""}) => Stream.periodic(const Duration(milliseconds: 1)).asyncMap((event) => getCarsWithFilter(model: model, brand: brand, price: price, places: places));
}
