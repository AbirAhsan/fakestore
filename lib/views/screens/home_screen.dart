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
        initialIndex: productCtrl.tabIndex.value,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(appName),
            bottom: PreferredSize(
              child: SizedBox(
                child: productCtrl.categoryList.isNotEmpty
                    ? TabBar(
                        isScrollable: true,
                        onTap: (index) => productCtrl.changeIndex(index),
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
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: productCtrl.product.length,
                            itemBuilder: (buildContext, index) {
                              return Text(productCtrl.product[index]!.title);
                            }),
                      ))
                  .toList(),
            ),
          ),
        )));
  }
}
