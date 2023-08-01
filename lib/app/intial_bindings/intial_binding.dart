import 'package:get/get.dart';
import 'package:taibaa/app/controllers/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
