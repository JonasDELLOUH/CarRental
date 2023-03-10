import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';
import '../models/car_brand.dart';
import 'base.dart';

class CarBrandService extends BaseServices {
  CarBrandService() {
    super.collectionName = FirestoreConstants.carBrand;
  }

  static final firestoreInstance = FirebaseFirestore.instance;

  Future<List<CarBrand>> getCarBrands() async {
    List<CarBrand> carBrandList = [];
    QuerySnapshot querySnapshot =
        await firestoreInstance.collection(collectionName).get();
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      CarBrand carBrand = CarBrand.basicFromMap(data);
      carBrandList.add(carBrand);
    }
    return carBrandList;
  }

  Stream<List<CarBrand>> getCarBrands1Stream() =>
      Stream.periodic(const Duration(seconds: 5))
          .asyncMap((_) => getCarBrands());
}
