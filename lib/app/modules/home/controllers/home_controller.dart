import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/modules/home/model/category_model.dart';
import 'package:taibaa/app/modules/home/model/home_title_model.dart';
import 'package:taibaa/app/modules/home/model/slider_model.dart';
import 'package:taibaa/app/modules/home/model/testimonal_model.dart';
import 'package:taibaa/app/modules/home/repositories/home_page_repository.dart';

class HomePageController extends GetxController {
  final RxBool _processing = false.obs;
  bool get processing => _processing.value;
  set processing(bool value) => _processing.value = value;

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final Rx<CategoryModel> _categoryModel = CategoryModel().obs;
  CategoryModel get categoryModel => _categoryModel.value;
  set categoryModel(CategoryModel value) => _categoryModel.value = value;

  final Rx<SliderModel> _sliderModel = SliderModel().obs;
  SliderModel get sliderModel => _sliderModel.value;
  set sliderModel(SliderModel value) => _sliderModel.value = value;

  final Rx<TestimonialModel> _testimonialModel = TestimonialModel().obs;
  TestimonialModel get testimonialModel => _testimonialModel.value;
  set testimonialModel(TestimonialModel value) =>
      _testimonialModel.value = value;

  final Rx<HomeTitleModel> _homeTitleModel = HomeTitleModel().obs;
  HomeTitleModel get homeTitleModel => _homeTitleModel.value;
  set homeTitleModel(HomeTitleModel value) => _homeTitleModel.value = value;

  PageController? pageController;

  @override
  Future<void> onInit() async {
    processing = true;
    pageController = PageController(initialPage: 0);
    final data = await Future.wait([
      HomeRepository.getCategoryApi(),
      HomeRepository.getSlidersApi(),
      HomeRepository.getTestimonialsApi(),
      HomeRepository.getHomeTitleApi(),
    ]);

    categoryModel = data[0] as CategoryModel;
    sliderModel = data[1] as SliderModel;
    testimonialModel = data[2] as TestimonialModel;
    homeTitleModel = data[3] as HomeTitleModel;
    processing = false;

    super.onInit();
  }
}
