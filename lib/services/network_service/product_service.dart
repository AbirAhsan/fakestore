import 'dart:convert';

import 'package:http/http.dart' as http;

import '../network_variables.dart';

class ProductApiService {
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
}
