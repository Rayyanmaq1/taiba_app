import 'package:taibaa/app/modules/bottom_nav/binding/bottom_nav_binding.dart';
import 'package:taibaa/app/modules/bottom_nav/page/bottom_nav.dart';
import 'package:taibaa/app/modules/home/binding/home_binding.dart';
import 'package:taibaa/app/modules/home/pages/home_page.dart';
import 'package:taibaa/app/modules/landing/binding/landing_page_binding.dart';
import 'package:taibaa/app/modules/landing/pages/landing_page.dart';
import 'package:taibaa/app/modules/landing/pages/splash.dart';
import 'package:taibaa/app/modules/login/binding/login_binding.dart';
import 'package:taibaa/app/modules/login/pages/login_page.dart';
import 'package:taibaa/app/modules/login/pages/verification_screen.dart';
import 'package:taibaa/app/routes/app_route.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.landing,
      page: () => const LandingPage(),
      binding: LandingPageBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.verificationScreen,
      page: () => const VerificationScreen(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.bottomNav,
      page: () => const BottomNav(),
      binding: BottomNavBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
