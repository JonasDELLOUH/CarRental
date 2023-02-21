import 'package:car_rental/presentation/main/main_controller.dart';
import 'package:car_rental/presentation/notifications/notifications_page.dart';
import 'package:car_rental/presentation/reservations/reservations_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/my_icons.dart';
import '../../core/models/customer.dart';
import '../../core/models/member.dart';
import '../../core/widgets/bar_item.dart';
import '../home/home_screen.dart';
import '../settings/settings.dart';

class MainScreen extends GetWidget<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(() => getCurrentWidget()),
      bottomNavigationBar: BottomAppBar(
        color: ConstColors.backgroundColor,
        child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              BarItem(
                  iconData: MyIcons.homeIconData(),
                  onPressed: () {
                    controller.selectedWidgetIndex.value = 1;
                  },
                  selected: controller.selectedWidgetIndex.value == 1
              ),
              BarItem(
                  iconData: MyIcons.carIconData(),
                  onPressed: () {
                    controller.selectedWidgetIndex.value = 2;
                  },
                  selected: controller.selectedWidgetIndex.value == 2),
              BarItem(
                  iconData: MyIcons.notificationIconData(),
                  onPressed: () {
                    controller.selectedWidgetIndex.value = 3;
                  },
                  selected: controller.selectedWidgetIndex.value == 3),
              BarItem(
                  iconData: MyIcons.settingIconData(),
                  onPressed: () {
                    controller.selectedWidgetIndex.value = 4;
                  },
                  selected: controller.selectedWidgetIndex.value == 4
                  )
            ],
          ),
        ),
      ),
    ));

  }
  Widget getCurrentWidget(){
    switch(controller.selectedWidgetIndex.value){
      case 1:
        return HomeScreen();
      case 2:
        return ReservationsPage(customer: Customer.defaultCustomer());
      case 3:
        return const NotificationsPage();
      case 4:
        return Settings(member: Member.defaultMember());
      default:
        return HomeScreen();
    }
  }
}

