import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController


  @override
  void onInit() {
    splashScreenDuration();
    super.onInit();
  }


  void splashScreenDuration(){
    Timer(const Duration(milliseconds: 3000), () {
      Get.offNamed(Routes.HOME);
    });
  }


}
