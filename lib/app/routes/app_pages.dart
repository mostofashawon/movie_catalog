import 'package:get/get.dart';

import 'package:movie_catalog/app/modules/home/bindings/home_binding.dart';
import 'package:movie_catalog/app/modules/home/views/home_view.dart';
import 'package:movie_catalog/app/modules/splash/bindings/splash_binding.dart';
import 'package:movie_catalog/app/modules/splash/views/splash_view.dart';

import '../modules/home/views/detail_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
