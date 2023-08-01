import 'package:get/get.dart';
import 'package:taibaa/app/modules/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
