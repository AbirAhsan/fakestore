import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isObsecurePass = true.obs;

  late final TextEditingController nameCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController passCtrl;

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passCtrl = TextEditingController();
    super.onInit();
  }

//<================== For Change Password Visibility
  changePasswordVisibility() {
    isObsecurePass.value = false;
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => {isObsecurePass.value = true});
  }

  // @override
  // void onClose() {
  //   nameCtrl.dispose();
  //   emailCtrl.dispose();
  //   passCtrl.dispose();
  //   super.onClose();
  // }
}
