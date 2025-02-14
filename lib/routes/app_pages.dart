/**
 * Created by Jaimin on 20/03/24.
 */

import 'package:get/get.dart';

import '../Screens/Cart/bindings/cart_bindings.dart';
import '../Screens/Cart/view/cart_view.dart';
import '../Screens/Home/bindings/home_bindings.dart';
import '../Screens/Home/view/home_view.dart';
import '../Screens/Splash/bindings/splash_bindings.dart';
import '../Screens/Splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
  ];
}
