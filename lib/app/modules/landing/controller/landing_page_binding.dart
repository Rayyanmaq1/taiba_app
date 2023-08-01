import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/modules/landing/model/carouel_model.dart';

class LandingPageController extends GetxController {
  final pageController = PageController();

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int index) => _currentIndex.value = index;

  void nextSlide() {
    if (pageController.hasClients) {
      currentIndex += 1;
      pageController.nextPage(
        curve: Curves.linearToEaseOut,
        duration: const Duration(seconds: 1),
      );
    }
  }
}

const landingPageSplashes = <CarouselObject>[
  CarouselObject(
    title: 'Welcome to \nTaibaa for Hajj & Umrah ',
    image: 'assets/modules/landing/splash_one.jpg',
  ),
  CarouselObject(
    title: 'Welcome to \nTaibaa for Hajj & Umrah',
    image: 'assets/modules/landing/splash_two.jpg',
  ),
  CarouselObject(
    title: 'Welcome to \nTaibaa for Hajj & Umrah',
    image: 'assets/modules/landing/splash_three.jpg',
  ),
  CarouselObject(
    title: 'Welcome to \nTaibaa for Hajj & Umrah',
    image: 'assets/modules/landing/splash_three.jpg',
  ),
];
