import 'package:fetching_displaying_data/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RemoteServices {
  static var client = http.Client();
  var isLoading = true.obs;

  static Future<List<Product>?> fetchProductList() async {
    var response = await client.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return ProductFromJson(jsonString);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
