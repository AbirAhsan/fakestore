import 'package:fakestore/controller/cart_controller.dart';
import 'package:fakestore/controller/product_controller.dart';
import 'package:fakestore/model/product_model.dart';
import 'package:fakestore/views/screens/product_details/product_hero_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_star/flutter_star.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel? productDetails;
  const ProductDetailsScreen({Key? key, @required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    final ProductController productCtrl = Get.put(ProductController());
    final CartController cartCtrl = Get.put(CartController());
    productCtrl.setProductCountInitialValue();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            primary: true,
            expandedHeight: 300.0,
            automaticallyImplyLeading: false,
            flexibleSpace: Hero(
              tag: productDetails!.id.toString() + productDetails!.image!,
              child: InkWell(
                onTap: () => Get.to(ProductHeroViewScreen(
                  heroTag:
                      productDetails!.id.toString() + productDetails!.image!,
                  imageLink: productDetails!.image,
                )),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productDetails!.title,
                      textScaleFactor: 0.8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  background: Image.network(
                    productDetails!.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: _width / 2,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                productCtrl.decreaseProductCount();
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                size: 32,
                              ),
                            ),
                            Obx(
                              () => Text(
                                "${productCtrl.productCount.value}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                productCtrl.increaseProductCount();
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          child: Obx(
                        () => Text(
                          "BDT: ${double.parse(productDetails!.price) * productCtrl.productCount.value}/-",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Product Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    productDetails!.description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Ratings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: StarScore(
                    score: double.parse(productDetails!.ratingModel!.rate),
                    star: Star(
                        fillColor: Colors.amber,
                        emptyColor: Colors.grey.withAlpha(88)),
                    tail: Column(
                      children: <Widget>[
                        Text("${productDetails!.ratingModel!.count} Person"),
                        Text(productDetails!.ratingModel!.rate),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      cartCtrl.addToCart(
                          productDetails!, productCtrl.productCount.toInt());
                    },
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
