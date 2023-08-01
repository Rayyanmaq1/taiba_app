class LoginModel {
  int? status;
  String? message;
  String? messageAr;
  String? devOtp;
  String? phoneCode;
  String? phone;

  LoginModel(
      {this.status,
      this.message,
      this.messageAr,
      this.devOtp,
      this.phoneCode,
      this.phone});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageAr = json['message_ar'];
    devOtp = json['dev_otp'];
    phoneCode = json['phone_code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['message_ar'] = this.messageAr;
    data['dev_otp'] = this.devOtp;
    data['phone_code'] = this.phoneCode;
    data['phone'] = this.phone;
    return data;
  }
}
