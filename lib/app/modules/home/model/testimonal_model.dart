class TestimonialModel {
  int? status;
  String? message;
  String? messageAr;
  List<Data>? data;

  TestimonialModel({this.status, this.message, this.messageAr, this.data});

  TestimonialModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
  String? eName;
  String? aName;
  String? eDesignation;
  String? aDesignation;
  String? eComment;
  String? aComment;
  String? image;
  String? thumbImage;
  String? createdAt;

  Data(
      {this.id,
      this.eName,
      this.aName,
      this.eDesignation,
      this.aDesignation,
      this.eComment,
      this.aComment,
      this.image,
      this.thumbImage,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eName = json['e_name'];
    aName = json['a_name'];
    eDesignation = json['e_designation'];
    aDesignation = json['a_designation'];
    eComment = json['e_comment'];
    aComment = json['a_comment'];
    image = json['image'];
    thumbImage = json['thumb_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['e_name'] = eName;
    data['a_name'] = aName;
    data['e_designation'] = eDesignation;
    data['a_designation'] = aDesignation;
    data['e_comment'] = eComment;
    data['a_comment'] = aComment;
    data['image'] = image;
    data['thumb_image'] = thumbImage;
    data['created_at'] = createdAt;
    return data;
  }
}
