class CategoryModel {
  int? status;
  String? message;
  String? messageAr;
  List<Data>? data;

  CategoryModel({this.status, this.message, this.messageAr, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? slug;
  String? eName;
  String? aName;
  String? image;
  String? thumbImage;
  int? subcategoryCount;
  int? tripCount;

  Data(
      {this.id,
      this.slug,
      this.eName,
      this.aName,
      this.image,
      this.thumbImage,
      this.subcategoryCount,
      this.tripCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    eName = json['e_name'];
    aName = json['a_name'];
    image = json['image'];
    thumbImage = json['thumb_image'];
    subcategoryCount = json['subcategory_count'];
    tripCount = json['trip_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['e_name'] = eName;
    data['a_name'] = aName;
    data['image'] = image;
    data['thumb_image'] = thumbImage;
    data['subcategory_count'] = subcategoryCount;
    data['trip_count'] = tripCount;
    return data;
  }
}
