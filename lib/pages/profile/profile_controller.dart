import 'dart:convert';

import 'package:fake_store/models/product_model.dart';
import 'package:fake_store/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_url.dart';

class ProfileController extends GetConnect {
  var users = <UserModel>[].obs;
  var product = UserModel().obs;
  var selectFav = false.obs;

  @override
  void onInit() {
    fetchUsersAPI();
  }

  Future<List<UserModel>> fetchUsersAPI() async {
    final response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.PROFILE_URL),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      users.value = list.map((model) => UserModel.fromJson(model)).toList().obs;
      print("products list ${users}");
    } else {
      throw Exception('Failed to load album');
    }
    return users.value;
  }

  Future<UserModel> fetchUserUpdateAPI({int? id, Map? data}) async {
    var body = json.encode(data);
    print("profile body $body");

    final response = await http.put(Uri.parse(AppConstants.BASE_URL + AppConstants.PROFILE_URL + "/$id"),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
