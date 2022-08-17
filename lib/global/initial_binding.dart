// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:exchange/src/pages/home/home_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
