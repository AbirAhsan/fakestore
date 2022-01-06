import 'package:fakestore/services/network_service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList categoryList = [].obs;

  @override
  onInit() {
    fetchCategories();
    super.onInit();
  }

  fetchCategories() {
    ProductApiService().getAllCategories().then((resp) {
      if (resp.isNotEmpty) {
        categoryList.value = resp;
      }
    });
  }
}
