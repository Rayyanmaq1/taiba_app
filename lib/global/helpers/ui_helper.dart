import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/utils/app_text_style.dart';

class UiHelper {
  UiHelper._();

  static var _snackId = '';

  static void showSnackbar(String title, String message, {onTap}) {
    if (_snackId == title + message) return;
    _snackId = title + message;

    Get.snackbar(
      '',
      '',
      onTap: onTap,
      padding: const EdgeInsets.only(bottom: 25, top: 20, left: 20, right: 20),
      borderRadius: 12,
      titleText: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.bold.copyWith(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles.bold.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: kRedColor,
    ).future.whenComplete(
          () => _snackId = '',
        );
  }
}
