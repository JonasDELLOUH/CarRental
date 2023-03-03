import 'package:car_rental/core/utility/functions.dart';
import 'package:car_rental/generated/assets.dart';
import 'package:car_rental/presentation/sign_in/sign_in_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../app/env/links.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/const_strings.dart';
import '../../core/widgets/text_field.dart';
import '../../core/widgets/text_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final SignInController controller = Get.find<SignInController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              color: Colors.blue,
              child: Image.asset(Assets.imagesWelcome, height: height * 0.3, width: width, fit: BoxFit.cover,),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: myText(
                            text: "sign".tr,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myText(
                            text: "password".tr,
                            textAlign: TextAlign.right,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        TextButton(
                            onPressed: () {},
                            child: myText(
                                text: "forget_password".tr,
                                textAlign: TextAlign.right,
                                fontSize: 15,
                                color: ConstColors.secondaryColor,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    textField(
                        controller: controller.passwordController,
                        hintText: ConstString.passwordIllust,
                        validator: (String? value) {
                          return value!.isEmpty ? "field_must_be_filled".tr : null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    RoundedLoadingButton(
                      width: width * 0.8,
                      color: ConstColors.secondaryColor,
                      height: 50,
                      controller: controller.btnController,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        } else {
                          controller.btnController.stop();
                        }
                      },
                      // color: ColorConstant.indigo300,
                      borderRadius: 10,
                      child: myText(
                          text: "sign_in".tr,
                          textAlign: TextAlign.right,
                          fontSize: 20,
                          color: ConstColors.whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(AppLinks.signUpRoute);
                                },
                              style: const TextStyle(
                                fontSize: 15,
                                color: ConstColors.secondaryColor,
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
          ],
        ),
      ),
    );
  }
}
