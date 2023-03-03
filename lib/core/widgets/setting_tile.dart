import 'package:car_rental/core/widgets/text_field.dart';
import 'package:car_rental/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'custom_text.dart';

Widget settingTile(
    {required String title,
    required String subTitle,
    required IconData iconData,
    IconData? trailingIconData,
 Function()? trailingAction,
    required BuildContext context,
    TextEditingController? textEditingController, TextInputType textInputType = TextInputType.text}) {
  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: Center(
              child: Icon(
                iconData,
                size: 40,
              ),
            )),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myText(
                text: title,
              ),
              CustomText(
                text: subTitle,
                fontSize: 15,
                color: ConstColors.primaryColor.withOpacity(0.7),
              ),
            ],
          ),
        ),
        if (trailingIconData != null)
          Expanded(
              flex: 2,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    trailingIconData,
                    size: 40,
                    color: ConstColors.secondaryColor,
                  ),
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: myText(
                              text: title,
                            ),
                            content: SingleChildScrollView(
                              child:
                                  textField(controller: textEditingController!, textInputType: textInputType),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: myText(
                                      text: 'cancel'.tr,
                                      color: ConstColors.secondaryColor)),
                              TextButton(
                                  onPressed: () {
                                    trailingAction!();
                                    Navigator.pop(context);
                                  },
                                  child: myText(
                                      text: 'edit'.tr,
                                      color: ConstColors.secondaryColor))
                            ],
                          );
                        });
                  },
                ),
              )),
      ],
    ),
  );
}
