import 'package:get/get.dart';
import 'package:taibaa/app/modules/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:taibaa/app/modules/home/controllers/home_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());

    Get.put(HomePageController(), permanent: true);
  }
}
