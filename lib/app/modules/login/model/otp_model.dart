class OtpModel {
  int? status;
  String? message;
  String? messageAr;

  OtpModel({this.status, this.message, this.messageAr});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageAr = json['message_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['message_ar'] = messageAr;
    return data;
  }
}
