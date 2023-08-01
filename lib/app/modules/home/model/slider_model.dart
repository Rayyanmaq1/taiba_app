class SliderModel {
  int? status;
  String? message;
  String? messageAr;
  List<Data>? data;

  SliderModel({this.status, this.message, this.messageAr, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    messageAr = json['message_ar'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['message_ar'] = messageAr;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? eImage;
  String? aImage;
  String? slug;

  Data({this.id, this.eImage, this.aImage, this.slug});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eImage = json['e_image'];
    aImage = json['a_image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['e_image'] = eImage;
    data['a_image'] = aImage;
    data['slug'] = slug;
    return data;
  }
}
