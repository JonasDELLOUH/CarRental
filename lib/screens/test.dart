import 'dart:io';

import 'package:car_rental/models/car.dart';
import 'package:car_rental/models/car_brand.dart';
import 'package:car_rental/services/car_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/my_gradient.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  late TextEditingController _controller;
  File? _imageFile;

  @override
  void initState() {
    _controller = TextEditingController();
    print(_imageFile);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: ColorTheme().base(),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: InkWell(
            onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Ecrivez quelque chose ..."),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: "Écrivez..", icon: Icon(Icons.power_input)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: (() => takePicture(ImageSource.camera)),
                          icon: Icon(Icons.camera)),
                      IconButton(
                          onPressed: (() => takePicture(ImageSource.gallery)),
                          icon: Icon(Icons.library_add))
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: (_imageFile == null)
                        ? Text("Aucune Image")
                        : Image.file(_imageFile!),
                  ),
                  Card(
                    elevation: 7.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: MyGradient(
                          startColor: Colors.blue,
                          endColor: Colors.red,
                          radius: 25,
                          horizontal: true),
                      child: TextButton(
                        child: Text("Envoyer"),
                        onPressed: () {
                          sendToFirebase();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  takePicture(ImageSource source) async {
    final imagePath = await ImagePicker()
        .pickImage(source: source, maxHeight: 500, maxWidth: 500);
    final file = File(imagePath!.path);
    setState(() {
      _imageFile = file;
    });
  }

  sendToFirebase() {
    FocusScope.of(context).requestFocus(FocusNode());
    // Navigator.pop(context);
    if ((_imageFile != null) ||
        (_controller.text != null && _controller.text != "")) {
      CarBrand carBrand = CarBrand(carBrandId: "VOvGIDu0uR68F6BPDliZ", carBrandImageUrl: "", carBrandName: "Mercedes");
      // CarBrandService carBrandService = CarBrandService();
      // carBrandService.addToFirebase(carBrand.toMap(), file: _imageFile);

      Car car = Car(carId: "", carBrand: carBrand, nbrPlaces: 5, nbrStars: 4, rentalPrice: 2500, carSpeed: 600, carImageUrl: "", carModel: "RTRS", addedDate: DateTime.now().millisecond, isReserved: false, isRented: false, overview: 'Cette voiture est haut game et très cool');
      CarServices carServices = CarServices();
      carServices.addToFirebase(car.toMap(), file: _imageFile);
    }
  }
}
