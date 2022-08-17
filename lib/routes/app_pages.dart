// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:exchange/global/initial_binding.dart';
import 'package:exchange/src/pages/home/home_page.dart';
import 'package:exchange/src/pages/splash/splash_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        transition: Transition.native,
        binding: InitialBinding()),
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        transition: Transition.native,
        binding: InitialBinding()),
  ];
}
