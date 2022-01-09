import 'package:fakestore/model/product_model.dart';
import 'package:fakestore/services/custom_eassy_loading.dart';
import 'package:fakestore/services/network_service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList categoryList = [].obs;
  RxInt tabIndex = 0.obs;
  RxList<ProductModel?> product = List<ProductModel?>.empty(growable: true).obs;

  @override
  onInit() {
    fetchCategories();
    super.onInit();
  }

  fetchCategories() async {
    try {
      await CustomEassyLoading().startLoading();
      ProductApiService().getAllCategories().then((resp) {
        if (resp.isNotEmpty) {
          categoryList.value = resp;
          fetchProductBySpecificCategory(categoryList[tabIndex.value]);
        }
      });
      CustomEassyLoading().stopLoading();
    } catch (e) {
      print(e.toString());
      CustomEassyLoading().stopLoading();
    }
  }

  changeIndex(int index) {
    tabIndex.value = index;

    fetchProductBySpecificCategory(categoryList[tabIndex.value]);

    print(tabIndex);
  }

  fetchProductBySpecificCategory(String category) async {
    try {
      await CustomEassyLoading().startLoading();
      ProductApiService().specificCategoryProducts(category).then((resp) {
        if (resp.isNotEmpty) {
          product.value = resp;
        }
      });
      CustomEassyLoading().stopLoading();
    } catch (e) {
      print(e.toString());
      CustomEassyLoading().stopLoading();
    }
  }
}
