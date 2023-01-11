import 'package:car_rental/constants/firestore_constants.dart';
import 'package:car_rental/models/car.dart';
import 'package:car_rental/models/car_brand.dart';
import 'package:car_rental/services/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarBrandService extends BaseServices {
  CarBrandService() {
    super.collectionName = FirestoreConstants.carBrand;
  }

  static final firestoreInstance = FirebaseFirestore.instance;

  Stream<List<CarBrand>> getCarBrands() async* {
    List<CarBrand> carBrandList = [];
    QuerySnapshot querySnapshot =
        await firestoreInstance.collection(collectionName).get();
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      CarBrand carBrand = CarBrand.basicFromMap(data);
      carBrandList.add(carBrand);
    }
    yield carBrandList;
  }
}
