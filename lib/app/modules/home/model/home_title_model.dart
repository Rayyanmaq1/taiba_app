class HomeTitleModel {
  int? status;
  String? message;
  String? messageAr;
  Data? data;

  HomeTitleModel({this.status, this.message, this.messageAr, this.data});

  HomeTitleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageAr = json['message_ar'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['message_ar'] = messageAr;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? eTitle;
  List<String>? aTitle;

  Data({this.eTitle, this.aTitle});

  Data.fromJson(Map<String, dynamic> json) {
    eTitle = json['e_title'].cast<String>();
    aTitle = json['a_title'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['e_title'] = eTitle;
    data['a_title'] = aTitle;
    return data;
  }
}
