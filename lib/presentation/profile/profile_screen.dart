import 'dart:io';

import 'package:car_rental/app/env/links.dart';
import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/core/constants/colors.dart';
import 'package:car_rental/core/constants/const_strings.dart';
import 'package:car_rental/core/utility/functions.dart';
import 'package:car_rental/presentation/profile/profile_controller.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/my_icons.dart';
import '../../core/widgets/setting_tile.dart';
import '../../core/widgets/text_widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final controller = Get.find<ProfileController>();
  final userSession = Get.find<UserSessionServiceInjected>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: myText(text: 'profile'.tr),
        elevation: 0.0,
        backgroundColor: ConstColors.blueColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                if (userSession.userIsCustomer.value)
                  InkWell(
                      onTap: () {
                        takePicture(ImageSource.gallery);
                      },
                      child: CircularProfileAvatar(
                        '',
                        borderColor: ConstColors.blueColor,
                        borderWidth: 5,
                        elevation: 2,
                        radius: width * 0.25,
                        child: controller.memberImage.value == null
                            ? Image.network(
                                userSession.customer.value!.memberImageUrl)
                            : Image.file(controller.memberImage.value!),
                      )),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => settingTile(
                      title: 'fullName'.tr,
                      subTitle: userSession.member.value!.fullName,
                      iconData: MyIcons.personIconData(),
                      trailingIconData: MyIcons.editIconData(),
                      textEditingController: controller.fullNameController,
                      trailingAction: () {
                        controller.updateMemberName();
                      },
                      context: context),
                ),
                const SizedBox(
                  height: 5,
                ),
                settingTile(
                    title: 'email'.tr,
                    subTitle: userSession.member.value!.email,
                    iconData: MyIcons.mailIconData(),
                    context: context),
                Obx(
                  () => settingTile(
                      title: 'phone_number'.tr,
                      subTitle: userSession.member.value!.phoneNumber,
                      iconData: MyIcons.phoneIconData(),
                      trailingIconData: MyIcons.editIconData(),
                      textEditingController: controller.phoneController,
                      textInputType: TextInputType.number,
                      trailingAction: () {
                        controller.updateMemberPhone();
                      },
                      context: context),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () async {
                    await removeSharedPref(ConstString.userUidPrefKey);
                    Get.offAllNamed(AppLinks.signInRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: width * 0.5,
                    decoration: const BoxDecoration(
                        color: ConstColors.blueColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Center(
                      child: myText(
                          text: 'log_out'.tr,
                          color: ConstColors.backgroundColor),
                    ),
                  ),
                )
              ],
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
    controller.memberImage.value = file;
    controller.updateCustomerImage();
  }
}
