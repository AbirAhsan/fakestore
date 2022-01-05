// ignore_for_file: avoid_print
import 'package:fakestore/controller/auth_controller.dart';
import 'package:fakestore/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final AuthController authCtrl = Get.put(AuthController());
    return Scaffold(
      body: SizedBox(
        height: _height,
        width: _width,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: authCtrl.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: "Email",
                  controller: authCtrl.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your e-mail";
                    }
                    //  else if (!validateEmail(value)) {
                    //   return "Email is not valid";
                    // }
                    return null;
                  },
                ),
                CustomTextField(
                  labelText: "Password",
                  controller: authCtrl.passCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.password],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password ?"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // if (validateAndSave(_formKey)) {
                    //   await CustomEassyLoading().startLoading();
                    //   await _signin();
                    //   EasyLoading.dismiss();
                    // }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Create New Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
