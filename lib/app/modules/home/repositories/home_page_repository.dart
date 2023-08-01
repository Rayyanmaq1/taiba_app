import 'dart:convert';
import 'package:taibaa/app/modules/home/model/category_model.dart';
import 'package:taibaa/app/modules/home/model/home_title_model.dart';
import 'package:taibaa/app/modules/home/model/slider_model.dart';
import 'package:http/http.dart' as http;
import 'package:taibaa/app/modules/home/model/testimonal_model.dart';
import 'package:taibaa/global/consts/constant.dart';

class HomeRepository {
  HomeRepository._();

  static Future<SliderModel> getSlidersApi() {
    return http.post(
      Uri.parse("$kBaseUrl/getSliders"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': kAuthorizeKey,
      },
    ).then((value) {
      final data = jsonDecode(value.body);
      SliderModel response = SliderModel.fromJson(data);
      return response;
    });
  }

  static Future<CategoryModel> getCategoryApi() {
    return http.post(
      Uri.parse("$kBaseUrl/getCategories"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': kAuthorizeKey,
      },
    ).then((value) {
      final data = jsonDecode(value.body);
      CategoryModel response = CategoryModel.fromJson(data);
      return response;
    });
  }

  static Future<TestimonialModel> getTestimonialsApi() {
    return http.post(
      Uri.parse("$kBaseUrl/getTestimonials"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': kAuthorizeKey,
      },
    ).then((value) {
      final data = jsonDecode(value.body);
      TestimonialModel response = TestimonialModel.fromJson(data);
      return response;
    });
  }

  static Future<HomeTitleModel> getHomeTitleApi() {
    return http.post(
      Uri.parse("$kBaseUrl/homeTitle"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': kAuthorizeKey,
      },
    ).then((value) {
      final data = jsonDecode(value.body);
      HomeTitleModel response = HomeTitleModel.fromJson(data);
      return response;
    });
  }
}
