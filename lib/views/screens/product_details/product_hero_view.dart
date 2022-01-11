import 'package:flutter/material.dart';

class ProductHeroViewScreen extends StatelessWidget {
  final String? heroTag;
  final String? imageLink;
  const ProductHeroViewScreen(
      {Key? key, required this.heroTag, required this.imageLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: _width,
        child: Center(
            child: Hero(
          tag: "$heroTag",
          child: Material(
            child: Image.network(
              imageLink!,
              fit: BoxFit.fill,
            ),
          ),
        )),
      ),
    );
  }
}
