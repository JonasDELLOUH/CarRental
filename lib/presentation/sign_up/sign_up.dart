import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/const_strings.dart';
import '../../core/widgets/text_field.dart';
import '../../core/widgets/text_widgets.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      text: "sign".tr,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 15,
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
                  controller: phoneController,
                  hintText: ConstString.phoneNumberIllust),
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
                  controller: phoneController,
                  hintText: ConstString.passwordIllust),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: height * 0.06,
                  width: width,
                  decoration: const BoxDecoration(
                    color: ConstColors.blueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: myText(
                        text: "sign_in".tr,
                        textAlign: TextAlign.right,
                        fontSize: 20,
                        color: ConstColors.whiteColor,
                        fontWeight: FontWeight.w500),
                  )),
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
              SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
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
                      SizedBox(
                        width: 10,
                      ),
                      myText(
                          text: "sign_in_google".tr,
                          textAlign: TextAlign.right,
                          fontSize: 15,
                          // color: ConstColors.blueColor,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
