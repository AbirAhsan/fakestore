import 'package:fakestore/controller/product_controller.dart';
import 'package:fakestore/views/variable/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.width;
    final ProductController productCtrl = Get.put(ProductController());
    return Obx(() => DefaultTabController(
        length: productCtrl.categoryList.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(appName),
            bottom: PreferredSize(
              child: SizedBox(
                child: productCtrl.categoryList.isNotEmpty
                    ? TabBar(
                        isScrollable: true,
                        tabs: productCtrl.categoryList
                            .map((element) => Tab(
                                  text: element,
                                ))
                            .toList())
                    : null,
              ),
              preferredSize: Size(
                _width,
                20.0,
              ),
            ),
          ),
          body: SizedBox(
            height: _height,
            width: _width,
            child: TabBarView(
              children: productCtrl.categoryList
                  .map((element) => Center(
                        child: Text(element),
                      ))
                  .toList(),
            ),
          ),
        )));
  }
}
