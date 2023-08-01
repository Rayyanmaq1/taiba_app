// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taibaa/app/modules/landing/controller/landing_page_binding.dart';
import 'package:taibaa/app/routes/app_route.dart';
import 'package:taibaa/generated/assets.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/utils/app_text_style.dart';
import 'package:taibaa/global/utils/widget_spacing.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taibaa/global/widgets/primary_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  final landingPageController = Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: _buildBottomContainer(),
      ),
    );
  }

  Widget _buildBottomContainer() {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLogo(),
          16.verticalSpace,
          _buildCurrentPageIndicator(),
          48.verticalSpace,
          _buildTextCarousel(),
          28.verticalSpace,
          _buildPrimayButton(),
          24.verticalSpace,
          _buildSkipText(),
        ],
      ),
    );
  }

  Widget _buildSkipText() {
    return FadeInRight(
      delay: const Duration(milliseconds: 600),
      child: CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: () => Get.offAllNamed(Routes.login),
        child: Text(
          'Skip for now',
          style: AppTextStyles.medium.copyWith(
            color: kRedishBlackColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTextCarousel() {
    return SizedBox(
      height: Get.height * 0.07,
      width: Get.width,
      child: PageView(
        controller: landingPageController.pageController,
        onPageChanged: (int index) {
          landingPageController.currentIndex = index;
        },
        children: [
          for (int i = 0; i < landingPageSplashes.length; i++) ...[
            Obx(() {
              final item = landingPageSplashes[
                  Get.find<LandingPageController>().currentIndex];
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInRight(
                      child: Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold.copyWith(
                          fontSize: Get.height * 0.024,
                        ),
                      ),
                    ),
                    8.verticalSpace,
                  ],
                ),
              );
            })
          ],
        ],
      ),
    );
  }

  Widget _buildCurrentPageIndicator() {
    return Obx(
      () => AnimatedSmoothIndicator(
        activeIndex: Get.find<LandingPageController>().currentIndex,
        count: landingPageSplashes.length,
        effect: const ColorTransitionEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: kRedColor,
          dotColor: kInActiveColor,
        ),
      ),
    );
  }

  Widget _buildPrimayButton() {
    return FadeInRight(
      delay: const Duration(milliseconds: 400),
      child: GetX<LandingPageController>(builder: (controller) {
        final isLastButton =
            controller.currentIndex + 1 == landingPageSplashes.length;
        return PrimaryButton(
          text: isLastButton ? 'Continue' : 'Continue',
          textFontWeight: FontWeight.w800,
          isHalfWidth: true,
          onPressed: () async {
            if (isLastButton) {
              Get.offAllNamed(Routes.login);
            } else {
              controller.nextSlide();
            }
          },
        );
      }),
    );
  }
}

Widget _buildLogo() {
  return SizedBox(
    height: Get.height * 0.3,
    width: Get.width * 0.4,
    child: Image.asset(
      Assets.appLogo,
    ),
  );
}
