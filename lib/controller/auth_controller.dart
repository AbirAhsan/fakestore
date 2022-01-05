import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    super.onClose();
  }
}
