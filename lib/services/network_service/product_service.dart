import 'dart:convert';

import 'package:fakestore/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../network_variables.dart';

class ProductApiService {
  //<================== Get All Categories
  Future<List> getAllCategories() async {
    Uri productCategoryUrl = Uri.parse("$baseUrl/products/categories");

    var response = await http.get(
      productCategoryUrl,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [];
    }
  }

//<================== Get Specific Category Products
  Future<List<ProductModel?>> specificCategoryProducts(String category) async {
    Uri url = Uri.parse("$baseUrl/products/category/$category");
    // print(url);
    // String _token = await SaveDataToLocal().loadToken();
    // String authorization = "Bearer $_token";
    var response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var decoded = json.decode(jsonResponse);
      print(decoded);
      List<ProductModel?> mapdatalist =
          decoded.map<ProductModel?>((b) => ProductModel.fromMap(b)).toList();
      print("Map List $mapdatalist");

      return mapdatalist;
    } else {
      throw Exception('Failed to load Products');
    }
  }
}
