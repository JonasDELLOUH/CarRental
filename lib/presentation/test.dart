import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core/models/car.dart';
import '../core/models/customer.dart';
import '../core/models/reservation.dart';
import '../core/services/reservation_services.dart';
import '../core/widgets/my_gradient.dart';



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
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: InkWell(
            onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Ecrivez quelque chose ..."),
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
    if (true) {
      Reservation reservation = Reservation(
          reservationId: "",
          customer: Customer.defaultCustomer(),
          car: Car.defaultCar(),
          reservationDate: DateTime.now().millisecondsSinceEpoch.toInt());
      ReservationServices reservationServices = ReservationServices();
      reservationServices.addToFirebase(reservation.toMap());
    }
  }
}
