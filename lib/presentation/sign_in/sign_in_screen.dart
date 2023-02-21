import 'package:car_rental/presentation/sign_in/sign_controller.dart';
import 'package:car_rental/presentation/home/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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
      body: Obx(
        () => SingleChildScrollView(
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
                          text: "sign_in".tr,
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
                      hintText: "email".tr),
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
                              color: ConstColors.blueColor,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  textField(
                      controller: controller.passwordController,
                      hintText: ConstString.passwordIllust),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedLoadingButton(
                    width: width * 0.8,
                    color:  ConstColors.blueColor,
                    height: 50,
                    controller: controller.btnController,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // controller.updateTodo(id: controller.todo.value!.id.toString());
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
                  // authProvider.authStatus == AuthStatus.Authentificating
                  //     ? const CircularProgressIndicator()
                  //     :
                  InkWell(
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                    child: Card(
                      child: SizedBox(
                        width: width,
                        height: height * 0.06,
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
}
