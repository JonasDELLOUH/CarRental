import 'package:car_rental/presentation/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/my_icons.dart';
import '../../core/models/member.dart';
import '../../core/widgets/setting_tile.dart';
import '../../core/widgets/text_widgets.dart';

class Settings extends StatelessWidget {
  final Member member;

  Settings({Key? key, required this.member}) : super(key: key);

  // _getMember() async {
  //   print("getting");
  //   customerProvider.customerStatus = CustomerStatus.GettingCustomer;
  //   customerProvider.notify();
  //
  //   isCustomer = await customerServices.isCustomer(widget.member);
  //   print("le id member : ${widget.member.memberId}");
  //   print(isCustomer);
  //   if(isCustomer == true){
  //     customer = await customerServices.getCustomer(widget.member);
  //     customerProvider.customerStatus = CustomerStatus.CustomerGot;
  //     customerProvider.notify();
  //     print("geting ok");
  //   } else {
  //     customerProvider.customerStatus = CustomerStatus.NoCustomer;
  //     customerProvider.notify();
  //     print("no Customer");
  //   }
  //
  //   customer = await customerProvider.getCustomer(member: widget.member);
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _settingsController.verifyIsCustomer(widget.member);
  //   // _getMember();
  // }

  // final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: richText(text: 'settings'.tr),
          elevation: 0.0,
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Obx(() {
              //   if (_controller.customer.value != null) {
              //     return Container(
              //       padding: EdgeInsets.only(bottom: 5),
              //       decoration: BoxDecoration(
              //           border: Border(
              //               bottom: BorderSide(
              //                   color: ConstColors.primaryColor
              //                       .withOpacity(0.5)))),
              //       child: Row(
              //         children: [
              //           CircleAvatar(
              //             backgroundImage: NetworkImage(
              //                 _controller.customer.value!.memberImageUrl),
              //             minRadius: width * 0.1,
              //           ),
              //           const SizedBox(
              //             width: 3,
              //           ),
              //           Column(
              //             children: [
              //               richText(
              //                   text:
              //                   _controller.customer.value!.member.fullName),
              //               richText(
              //                   text: _controller.customer.value!.member.email,
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w400,
              //                   color:
              //                       ConstColors.primaryColor.withOpacity(0.7)),
              //             ],
              //           )
              //         ],
              //       ),
              //     );
              //   } else {
              //     return Container();
              //   }
              // }),
              const SizedBox(
                height: 5,
              ),
              settingTile(
                  title: 'account'.tr,
                  subTitle: 'account_description'.tr,
                  iconData: MyIcons.personIconData()),
              settingTile(title: 'app_language'.tr, subTitle: 'app_language_description'.tr, iconData: MyIcons.languageIconData()),
              settingTile(title: 'dark_mode'.tr, subTitle: 'dark_mode_description'.tr, iconData: MyIcons.darkModeIconData())
            ],
          ),
        ));
  }
}
