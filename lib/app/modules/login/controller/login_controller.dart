import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';

class LoginController extends GetxController {
  final _processing = false.obs;
  bool get processing => _processing.value;
  set processing(value) => _processing.value = value;

  OtpFieldController otpFieldController = OtpFieldController();
  TextEditingController phoneController = TextEditingController();
  RxString countryCode = '+974'.obs;
  RxString verifyOpt = ''.obs;
}
