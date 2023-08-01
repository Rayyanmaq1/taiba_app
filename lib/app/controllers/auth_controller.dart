import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final RxBool _userLoggedIn = false.obs;
  bool get userLoggedIn => _userLoggedIn.value;
  set userLoggedIn(bool value) {
    _userLoggedIn.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var loggedIn = prefs.getBool('userLoggedIn') ?? false;
    if (loggedIn) {
      userLoggedIn = true;
    } else {
      userLoggedIn = false;
    }
  }
}
