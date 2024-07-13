import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_catalog/app/util/app_color.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,

        body: Center(
          child: Text(
            'Movie Catalog ',
            style: TextStyle(fontSize: 20,color: AppColors.colorLightGrey,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

