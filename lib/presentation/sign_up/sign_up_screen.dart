import 'package:car_rental/presentation/sign_up/sign_up_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/const_strings.dart';
import '../../core/utility/functions.dart';
import '../../core/widgets/text_field.dart';
import '../../core/widgets/text_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
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
                        text: "sign_up_label".tr,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                const SizedBox(
                  height: 15,
                ),
                myText(
                    text: "email".tr,
                    textAlign: TextAlign.right,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 5,
                ),
                textField(
                    controller: controller.emailController,
                    hintText: "email".tr,
                    validator: (String? value) {
                      return value!.isEmpty
                          ? "field_must_be_filled".tr
                          : !isEmailValid(value)
                              ? "enter_valid_mail".tr
                              : null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                myText(
                    text: "fullName".tr,
                    textAlign: TextAlign.right,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 5,
                ),
                textField(
                    controller: controller.fullNameController,
                    hintText: "fullName".tr,
                    validator: (String? value) {
                      return value!.isEmpty ? "field_must_be_filled".tr : null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                myText(
                    text: "phone_number".tr,
                    textAlign: TextAlign.right,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 5,
                ),
                textField(
                    controller: controller.phoneController,
                    hintText: "phone_number".tr,
                    validator: (String? value) {
                      return value!.isEmpty ? "field_must_be_filled".tr : null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                myText(
                    text: "password".tr,
                    textAlign: TextAlign.right,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                const SizedBox(
                  height: 5,
                ),
                textField(
                    controller: controller.passwordController,
                    hintText: "password".tr,
                    validator: (String? value) {
                      return value!.isEmpty ? "field_must_be_filled".tr : null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                RoundedLoadingButton(
                  width: width * 0.8,
                  color: ConstColors.blueColor,
                  height: 50,
                  controller: controller.btnController,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.signUp();
                    } else {
                      controller.btnController.stop();
                    }
                  },
                  // color: ColorConstant.indigo300,
                  borderRadius: 10,
                  child: myText(
                      text: "sign_up".tr,
                      textAlign: TextAlign.right,
                      fontSize: 20,
                      color: ConstColors.whiteColor,
                      fontWeight: FontWeight.w500),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "have_not_account".tr,
                          style: const TextStyle(
                              fontSize: 15,
                              color: ConstColors.primaryColor,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: "sign_up".tr,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            fontSize: 15,
                            color: ConstColors.blueColor,
                            fontWeight: FontWeight.w500,
                          ))
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedLoadingButton(
                  width: width * 0.8,
                  color: ConstColors.whiteColor,
                  height: 50,
                  disabledColor: ConstColors.redColor,
                  controller: controller.googleBtnController,
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                  // color: ColorConstant.indigo300,
                  borderRadius: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      myText(
                          text: "sign_in_google".tr,
                          textAlign: TextAlign.right,
                          fontSize: 15,
                          // color: ConstColors.blueColor,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
