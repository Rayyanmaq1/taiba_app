import 'dart:convert';
import 'package:taibaa/app/modules/login/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:taibaa/app/modules/login/model/otp_model.dart';
import 'package:taibaa/global/consts/constant.dart';

class LoginRepositories {
  LoginRepositories._();
  static Future<LoginModel> loginApi({String? code, String? phone}) {
    return http.post(
      Uri.parse("$kBaseUrl/login"),
      body: jsonEncode({"phone_code": code, "phone": phone}),
      headers: <String, String>{
        'uuid': 'text',
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': kAuthorizeKey,
      },
    ).then((value) {
      final data = jsonDecode(value.body);
      LoginModel response = LoginModel.fromJson(data);
      return response;
    });
  }

  static Future<OtpModel> verifyOpt({String? pin}) {
    return http.post(
      Uri.parse("$kBaseUrl/verifyOtp"),
      body: jsonEncode({"otp": pin}),
      headers: <String, String>{
        'uuid': 'text',
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': kAuthorizeKey,
      },
    ).then((value) {
      final data = jsonDecode(value.body);
      OtpModel response = OtpModel.fromJson(data);
      return response;
    });
  }
}
