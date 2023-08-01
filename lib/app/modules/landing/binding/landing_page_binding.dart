import 'package:get/get.dart';
import 'package:taibaa/app/modules/landing/controller/landing_page_binding.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingPageController());
  }
}
