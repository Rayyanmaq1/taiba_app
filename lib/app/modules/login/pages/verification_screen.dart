// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:taibaa/app/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/modules/login/repository/repository.dart';
import 'package:taibaa/app/routes/app_route.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/helpers/ui_helper.dart';
import 'package:taibaa/global/utils/app_text_style.dart';
import 'package:taibaa/global/utils/widget_spacing.dart';
import 'package:taibaa/global/widgets/loading_overlay.dart';
import 'package:taibaa/global/widgets/primary_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends GetView<LoginController> {
  const VerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: kWhiteColor,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Verification',
                    style: AppTextStyles.semiBold.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  14.verticalSpace,
                  Text(
                    'You will get OPT via SMS',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.normal.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  (Get.height * 0.05).toInt().verticalSpace,
                  Row(
                    children: [
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 30,
                        controller: controller.otpFieldController,
                        style: AppTextStyles.medium,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        onCompleted: (pin) async {
                          controller.processing = true;
                          controller.verifyOpt.value = pin;
                          final data =
                              await LoginRepositories.verifyOpt(pin: pin);
                          controller.processing = false;
                          if (data.status == 200) {
                            UiHelper.showSnackbar('Success!', data.message!);
                            Get.offAllNamed(Routes.bottomNav);
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('userLoggedIn', true);
                            Get.offAndToNamed(Routes.bottomNav);
                          } else {
                            controller.processing = false;
                            UiHelper.showSnackbar('Error!', data.message!);
                          }
                        },
                      ),
                    ],
                  ),
                  (Get.height * 0.03).toInt().verticalSpace,
                  PrimaryButton(
                    text: 'VERIFY',
                    onPressed: () async {
                      controller.processing = true;
                      if (controller.verifyOpt.value.length == 6) {
                        final data = await LoginRepositories.verifyOpt(
                          pin: controller.verifyOpt.value,
                        );
                        controller.processing = false;

                        if (data.status == 200) {
                          UiHelper.showSnackbar('Success!', data.message!);
                          Get.offAllNamed(Routes.bottomNav);
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('userLoggedIn', true);
                          Get.offAndToNamed(Routes.bottomNav);
                        } else {
                          UiHelper.showSnackbar('Error!', data.message!);
                        }
                      } else {
                        controller.processing = false;
                        UiHelper.showSnackbar('Error!', 'Invalid request');
                      }
                    },
                    isHalfWidth: true,
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => controller.processing
                ? const LoadingOverlay()
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
