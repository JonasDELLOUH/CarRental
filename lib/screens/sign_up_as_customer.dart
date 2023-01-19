import 'dart:io';
import 'package:car_rental/constants/my_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../widgets/text_widgets.dart';

class SignUpAsCustomer extends StatefulWidget {
  const SignUpAsCustomer({Key? key}) : super(key: key);

  @override
  State<SignUpAsCustomer> createState() => _SignUpAsCustomerState();
}

class _SignUpAsCustomerState extends State<SignUpAsCustomer> {
  File? _identityFile;
  File? _memberImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.3,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: myText(
                      text: "sign_up_to_customer".tr,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              myText(
                  text: "identity_file".tr,
                  textAlign: TextAlign.right,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  // takeFile();
                },
                child: Card(
                  child: _identityFile == null
                      ? richText(text: 'add_identity_file'.tr)
                      : richText(text: _identityFile!.path),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              myText(
                  text: "profile_tof".tr,
                  textAlign: TextAlign.right,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        takePicture(ImageSource.camera);
                      },
                      child: MyIcons.cameraIcon(color: ConstColors.whiteColor)),
                  ElevatedButton(
                      onPressed: () {
                        takePicture(ImageSource.gallery);
                      },
                      child: MyIcons.libraryAddIcon(color: ConstColors.whiteColor))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.2,
                child: Center(
                  child: _memberImage != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          child: Image.file(_memberImage!))
                      : richText(text: 'no_image'.tr),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  // width: width * 0.45,
                  decoration: const BoxDecoration(
                      color: ConstColors.blueColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Center(
                    child: richText(
                        text: 'submit'.tr,
                        color: ConstColors.backgroundColor),
                  ),
                ),
              )
            ],
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
      _memberImage = file;
    });
  }

// takeFile() async {
//   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//   if (result != null) {
//     setState(() {
//       _identityFile = File(result.files.single.path!);
//     });
//   } else {}
// }
}
