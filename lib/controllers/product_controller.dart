import 'package:get/get.dart';
import 'package:fetching_displaying_data/model/product.dart';
import 'package:fetching_displaying_data/services/remote.dart';

class ProductController extends GetxController {
  //  var productList = <Product>[].obs;
  var ProductList = <Product>[].obs;
  var name = "name".obs;
  var _isFavorite = false.obs;
  bool get isFavorite => _isFavorite.value;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var product = await RemoteServices.fetchProductList();
    if (product != null) {
      ProductList.value = product;
      print(ProductList.value);
    }
  }
}
