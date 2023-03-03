import 'dart:io';
import 'package:car_rental/presentation/sign_up_as_customer/sign_up_as_customer_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/my_icons.dart';
import '../../../core/widgets/text_widgets.dart';

class SignUpAsCustomerScreen extends StatelessWidget {
  SignUpAsCustomerScreen({Key? key}) : super(key: key);
  final controller = Get.find<SignUpAsCustomerController>();

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
                  takeFile();
                },
                child: Card(
                  child: Obx(
                    () => controller.identityFile.value == null
                        ? myText(text: 'add_identity_file'.tr)
                        : myText(text: controller.identityFile.value!.path),
                  ),
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
                      child:
                          MyIcons.libraryAddIcon(color: ConstColors.whiteColor))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * 0.2,
                child: Center(
                  child: Obx(
                    () => controller.memberImage.value != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                            child: Image.file(controller.memberImage.value!))
                        : myText(text: 'no_image'.tr),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedLoadingButton(
                width: width * 0.8,
                color: ConstColors.secondaryColor,
                height: 50,
                controller: controller.btnController,
                onPressed: () {
                  controller.signUpAsCustomer();
                },
                // color: ColorConstant.indigo300,
                borderRadius: 10,
                child: myText(
                    text: "submit".tr,
                    textAlign: TextAlign.right,
                    fontSize: 20,
                    color: ConstColors.whiteColor,
                    fontWeight: FontWeight.w500),
              ),
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
    controller.memberImage.value = file;
  }

  takeFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      controller.identityFile.value = File(result.files.single.path!);
    }
  }
}
