import 'package:car_rental/presentation/home/home_screen.dart';
import 'package:car_rental/presentation/home/home_binding.dart';
import 'package:car_rental/presentation/main/main_screen.dart';
import 'package:car_rental/presentation/reservations/reservation_binding.dart';
import 'package:car_rental/presentation/sign_in/sign_in_screen.dart';
import 'package:car_rental/presentation/sign_in/sign_in_binding.dart';
import 'package:car_rental/presentation/splash1/splash1_binding.dart';
import 'package:car_rental/presentation/splash1/splash1_screen.dart';
import 'package:get/get.dart';

import '../../core/models/customer.dart';
import '../../presentation/main/main_binding.dart';
import '../../presentation/reservations/reservations_page.dart';
import '../../presentation/splash2/splash2_binding.dart';
import '../../presentation/splash2/splash2_screen.dart';
import 'links.dart';


class AppRouting {
  static final routes = [
    GetPage(
        name: AppLinks.signInRoute,
        page: () => SignInScreen(),
        binding: SignInBinding()),
    GetPage(
        name: AppLinks.mainRoute,
        page: () => const MainScreen(),
        binding: MainBinding()),
    GetPage(
        name: AppLinks.homeRoute, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: AppLinks.splash1Route,
        page: () => const Splash1Screen(),
        binding: Splash1Binding()),
    GetPage(
        name: AppLinks.splash2Route,
        page: () => const Splash2Screen(),
        binding: Splash2Binding()),
    GetPage(
        name: AppLinks.reservationRoute,
        page: () => ReservationsPage(
              customer: Customer.defaultCustomer(),
            ),
        binding: ReservationBinding())
  ];
}
