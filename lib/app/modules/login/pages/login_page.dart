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
import 'package:taibaa/global/widgets/primary_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
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
                    'We will send you a One Time Code\non your phone number.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.normal.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  (Get.height * 0.05).toInt().verticalSpace,
                  SizedBox(
                    width: Get.width * 0.92,
                    child: Row(
                      children: [
                        CountryCodePicker(
                          backgroundColor: kRedishBlackColor,
                          onChanged: (code) =>
                              controller.countryCode.value = code.code!,
                          initialSelection: 'QA',
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        SizedBox(
                          width: Get.width * 0.6,
                          child: PrimaryTextField(
                            controller: controller.phoneController,
                            hintText: 'Enter Phone Number',
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            borderRadius: 0,
                            backgroundColor: kRedishBlackColor.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  (Get.height * 0.03).toInt().verticalSpace,
                  PrimaryButton(
                    text: 'GET OTP',
                    onPressed: () async {
                      controller.processing = true;
                      if (controller.phoneController.text.isNotEmpty) {
                        final data = await LoginRepositories.loginApi(
                          code: controller.countryCode.value,
                          phone: controller.phoneController.text,
                        );
                        controller.processing = false;
                        if (data.status == 200) {
                          UiHelper.showSnackbar('Success!', data.message!);
                          Get.toNamed(Routes.verificationScreen);
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
