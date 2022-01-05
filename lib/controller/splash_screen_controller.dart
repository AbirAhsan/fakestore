import 'package:fakestore/views/screens/auth_screen/login_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  int time = 3;

  @override
  void onInit() {
    waitAndNavigate();
    super.onInit();
  }

  waitAndNavigate() {
    Future.delayed(Duration(seconds: time))
        .then((value) => Get.offAll(const LoginScreen()));
  }
}
