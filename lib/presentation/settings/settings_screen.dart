import 'package:car_rental/app/env/links.dart';
import 'package:car_rental/app/getxservice/user_session_injected.dart';
import 'package:car_rental/presentation/settings/settings_controller.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/my_icons.dart';
import '../../core/widgets/setting_tile.dart';
import '../../core/widgets/text_widgets.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  final userSession = Get.find<UserSessionServiceInjected>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: myText(text: 'settings'.tr),
          elevation: 0.0,
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color:
                                  ConstColors.primaryColor.withOpacity(0.5)))),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppLinks.profileRoute);
                    },
                    child: Obx(
                      () => Row(
                        children: [
                          if (userSession.userIsCustomer.value)
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userSession.customer.value!.memberImageUrl),
                              minRadius: width * 0.1,
                            ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                myText(
                                    text: userSession.member.value!.fullName,
                                    fontWeight: FontWeight.w600),
                                myText(
                                    text: userSession.member.value!.email,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: ConstColors.primaryColor
                                        .withOpacity(0.7)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppLinks.profileRoute);
                },
                child: settingTile(
                    title: 'account'.tr,
                    subTitle: 'account_description'.tr,
                    iconData: MyIcons.personIconData(),
                    context: context),
              ),
              InkWell(
                onTap: (){
                  DropDownState(
                    DropDown(
                      bottomSheetTitle: const Text(
                        "Priorité de la tâche",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      submitButtonChild: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      data: controller.listOfCities ?? [],
                      selectedItems: (List<dynamic> selectedList) {
                        // List<String> list = [];
                        // for (var item in selectedList) {
                        //   if (item is SelectedListItem) {
                        //     controller.priority.value = item.value!;
                        //   }
                        // }
                        // showSnackBar(list.toString());
                      },
                      enableMultipleSelection: false,
                    ),
                  ).showModal(context);
                },
                child: settingTile(
                    title: 'app_language'.tr,
                    subTitle: 'app_language_description'.tr,
                    iconData: MyIcons.languageIconData(),
                    context: context),
              ),
              settingTile(
                  title: 'dark_mode'.tr,
                  subTitle: 'dark_mode_description'.tr,
                  iconData: MyIcons.darkModeIconData(),
                  context: context)
            ],
          ),
        ));
  }
}
