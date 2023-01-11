import 'package:car_rental/constants/colors.dart';
import 'package:car_rental/screens/notifications_page.dart';
import 'package:car_rental/screens/reservations_page.dart';
import 'package:car_rental/screens/setings_page.dart';
import 'package:car_rental/widgets/bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/my_icons.dart';
import '../models/customer.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    WhatPageProvider whatPageProvider = Provider.of<WhatPageProvider>(context);
    return Scaffold(
      key: _globalKey,
      body: whatPageProvider.whatPageStatus == WhatPageStatus.home
          ? const Home()
          : whatPageProvider.whatPageStatus == WhatPageStatus.notification
              ? const NotificationsPage()
              : whatPageProvider.whatPageStatus == WhatPageStatus.setting
                  ? const SettingsPage()
                  : whatPageProvider.whatPageStatus ==
                          WhatPageStatus.reservation
                      ? ReservationsPage(
                          customer: Customer.defaultCustomer(),
                        )
                      : const CircularProgressIndicator(),
      bottomNavigationBar: BottomAppBar(
        color: ConstColors.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            BarItem(
                iconData: MyIcons.homeIconData(),
                onPressed: () {
                  whatPageProvider.whatPageStatus = WhatPageStatus.home;
                  whatPageProvider.notify();
                },
                selected:
                    whatPageProvider.whatPageStatus == WhatPageStatus.home),
            BarItem(
                iconData: MyIcons.carIconData(),
                onPressed: () {
                  whatPageProvider.whatPageStatus = WhatPageStatus.reservation;
                  whatPageProvider.notify();
                },
                selected: whatPageProvider.whatPageStatus ==
                    WhatPageStatus.reservation),
            BarItem(
                iconData: MyIcons.notificationIconData(),
                onPressed: () {
                  whatPageProvider.whatPageStatus = WhatPageStatus.notification;
                  whatPageProvider.notify();
                },
                selected: whatPageProvider.whatPageStatus ==
                    WhatPageStatus.notification),
            BarItem(
                iconData: MyIcons.settingIconData(),
                onPressed: () {
                  whatPageProvider.whatPageStatus = WhatPageStatus.setting;
                  whatPageProvider.notify();
                },
                selected:
                    whatPageProvider.whatPageStatus == WhatPageStatus.setting)
          ],
        ),
      ),
    );
  }
}

enum WhatPageStatus { home, notification, setting, reservation }

class WhatPageProvider extends ChangeNotifier {
  WhatPageStatus _whatPageStatus = WhatPageStatus.home;

  WhatPageStatus get whatPageStatus => _whatPageStatus;

  set whatPageStatus(WhatPageStatus value) {
    _whatPageStatus = value;
  }

  notify() {
    notifyListeners();
  }
}
