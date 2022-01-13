import 'package:fakestore/controller/cart_controller.dart';
import 'package:fakestore/controller/product_controller.dart';
import 'package:fakestore/model/product_model.dart';
import 'package:fakestore/views/screens/product_details/product_details_screen.dart';
import 'package:fakestore/views/variable/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'home_screen_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
//    double _height = MediaQuery.of(context).size.width;
    final ProductController productCtrl = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());
    return Obx(() => DefaultTabController(
        length: productCtrl.categoryList.length,
        initialIndex: productCtrl.tabIndex.value,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(appName),
            actions: [
              Container(
                child: Stack(
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 46,
                    ),
                    cartController.cartListFromLocal.isEmpty
                        ? Container()
                        : Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 12,
                              child: Text(
                                cartController.cartListFromLocal.length > 9
                                    ? "9+"
                                    : cartController.cartListFromLocal.length
                                        .toString(),
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                  ],
                ),
              )
            ],
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
            width: _width,
            child: TabBarView(
              children: productCtrl.categoryList
                  .map(
                    (element) => Center(
                      child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: productCtrl.product.length,
                          itemBuilder: (buildContext, index) {
                            ProductModel? product = productCtrl.product[index];
                            return HomeGridViewWidget(
                              onTap: () => Get.to(ProductDetailsScreen(
                                  productDetails: product)),
                              title: product!.title,
                              imageUrl: product.image,
                              price: product.price,
                              rate: product.ratingModel!.rate,
                            );
                          }),
                    ),
                  )
                  .toList(),
            ),
          ),
        )));
  }
}
