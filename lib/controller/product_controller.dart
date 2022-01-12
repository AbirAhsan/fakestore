import 'package:fakestore/model/product_model.dart';
import 'package:fakestore/services/custom_eassy_loading.dart';
import 'package:fakestore/services/network_service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList categoryList = [].obs;
  RxInt tabIndex = 0.obs;

  // <<================For product Count
  RxInt productCount = 1.obs;

  List listOfProductList = [];
  RxList<ProductModel?> product = List<ProductModel?>.empty(growable: true).obs;

  @override
  onInit() {
    fetchCategories();

    super.onInit();
  }

  setProductCountInitialValue() {
    productCount.value = 1;
  }

  fetchCategories() async {
    try {
      await CustomEassyLoading().startLoading();
      ProductApiService().getAllCategories().then((resp) {
        if (resp.isNotEmpty) {
          categoryList.value = resp;
          generatelistOfProductList();
          fetchProductBySpecificCategory(categoryList[tabIndex.value]);
        }
      });
      CustomEassyLoading().stopLoading();
    } catch (e) {
      print(e.toString());
      CustomEassyLoading().stopLoading();
    }
  }

  generatelistOfProductList() {
    for (var i = 1; i < categoryList.length; i++) {
      listOfProductList.clear();
      listOfProductList.add({
        {"cat": "${categoryList[i]}"},
        {"list": product},
      });
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
          listOfProductList.where((element) => element["cat"] == category);
        }
      });
      CustomEassyLoading().stopLoading();
    } catch (e) {
      print(e.toString());
      CustomEassyLoading().stopLoading();
    }
  }

//
  increaseProductCount() {
    productCount.value++;
  }

  decreaseProductCount() {
    if (productCount.value > 1) {
      productCount.value--;
    }
  }
}
