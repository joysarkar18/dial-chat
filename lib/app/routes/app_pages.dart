import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navBar/bindings/nav_bar_binding.dart';
import '../modules/navBar/views/nav_bar_view.dart';
import '../modules/phonenumber/bindings/phonenumber_binding.dart';
import '../modules/phonenumber/views/phonenumber_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PHONENUMBER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.PHONENUMBER,
      page: () => const PhonenumberView(),
      binding: PhonenumberBinding(),
    ),
  ];
}
