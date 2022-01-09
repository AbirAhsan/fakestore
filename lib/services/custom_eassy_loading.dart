import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomEassyLoading {
  //<=============== Start Loading Function
  startLoading() async {
    await EasyLoading.show(
      status: "Loading ... ",
      indicator: Image.asset(
        "assets/images/wolf.gif",
        width: 100,
        height: 130,
      ),
    );
  }

//<<================ Stop Loading Function
  stopLoading() async {
    await EasyLoading.dismiss();
  }
}
