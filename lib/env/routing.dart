import 'package:car_rental/env/links.dart';
import 'package:car_rental/screens/main/main_screen.dart';
import 'package:car_rental/screens/sign_in/sign_in.dart';
import 'package:car_rental/screens/sign_in/sign_in_binding.dart';
import 'package:car_rental/screens/splash1/splash1_binding.dart';
import 'package:car_rental/screens/splash1/splash1_screen.dart';
import 'package:get/get.dart';

import '../models/member.dart';
import '../screens/main/main_binding.dart';
import '../screens/settings/settings.dart';
import '../screens/splash2/splash2_binding.dart';
import '../screens/splash2/splash2_screen.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
        name: AppLinks.signIn,
        page: () => const SignIn(),
        binding: SignInBinding()),
    GetPage(
        name: AppLinks.mainScreen,
        page: () => const MainScreen(),
        binding: MainBinding()),
    GetPage(
      name: AppLinks.splash1Screen,
      page: () => const Splash1Screen(),
      binding: Splash1Binding()
    ),
    GetPage(
        name: AppLinks.splash2Screen,
        page: () => const Splash2Screen(),
        binding: Splash2Binding()
    )
  ];
}
