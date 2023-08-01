import 'package:get/get.dart';
import 'package:taibaa/app/modules/home/controllers/home_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
