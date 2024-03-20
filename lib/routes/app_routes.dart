/**
 * Created by Jaimin on 20/03/24.
 */

part of 'app_pages.dart';

abstract class Routes {
  /*============================ | Phase1 Pages | =========================*/

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const CART = _Paths.CART;
}

abstract class _Paths {
  /*============================ | Phase1 Pages | =========================*/

  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const CART = '/cart';
}
