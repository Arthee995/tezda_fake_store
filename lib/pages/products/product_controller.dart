import 'dart:convert';

import 'package:fake_store/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_url.dart';

class ProductController extends GetConnect {
  var products = <ProductModel>[].obs;
  var product = ProductModel().obs;


  @override
  void onInit() {
    fetchProductAPI();
      }

  Future<List<ProductModel>> fetchProductAPI() async {
    final response = await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCTS_URL),
        headers: {"Content-Type": "application/json"},
        );

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      products.value = list.map((model) => ProductModel.fromJson(model)).toList().obs;
      print("products list ${products}");

    } else {
      throw Exception('Failed to load album');
    }
    return products.value;

  }

  Future<ProductModel> fetchProductDetailAPI({
    int? id
}) async {
    final response = await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCTS_URL +"/${id}"),
      headers: {"Content-Type": "application/json"},

          );

    if (response.statusCode == 200) {
      product.value =  ProductModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);



    } else {
      throw Exception('Failed to load album');
    }
    return product.value;

  }
}
