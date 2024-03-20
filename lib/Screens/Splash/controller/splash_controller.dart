/**
 * Created by Jaimin on 20/03/24.
 */

import 'dart:async';

import 'package:get/get.dart';
import 'package:jaimin_chpl_practical/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    loadApp();
    super.onInit();
  }

  void loadApp() {
    Timer(const Duration(seconds: 2), () => Get.toNamed(Routes.HOME));
  }
}
