import 'dart:convert';

import 'package:fake_store/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_url.dart';

class ProductController extends GetxController{

  @override
  void onInit() {
    fetchProductAPI();
      }

  Future<ProductModel> fetchProductAPI() async {

    final response = await http.post(Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCTS_URL),
        headers: {"Content-Type": "application/json"},
        );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
