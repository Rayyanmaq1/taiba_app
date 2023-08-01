import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/controllers/auth_controller.dart';
import 'package:taibaa/app/routes/app_route.dart';
import 'package:taibaa/generated/assets.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (Get.find<AuthController>().userLoggedIn) {
        Get.offAllNamed(Routes.bottomNav);
      } else {
        Get.offAllNamed(Routes.landing);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: Get.height * 0.5,
              width: Get.width * 0.5,
              child: Image.asset(
                Assets.appLogo,
              ).animate().fade().scale(),
            ),
          ),
        ),
      ),
    );
  }
}
