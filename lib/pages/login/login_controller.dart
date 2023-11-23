import 'dart:convert';

import 'package:fake_store/models/login_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_url.dart';


class LoginController extends GetxController{


  Future<LoginModel> fetchLoginAPI({String? userName,String? password}) async {
    Map data = {
      "username": userName,
      "password": password
    };
    var body = json.encode(data);


    final response = await http.post(Uri.parse(AppConstants.BASE_URL + AppConstants.LOGIN_URL),
        headers: {"Content-Type": "application/json"},
        body: body);
    if (response.statusCode == 200) {
           return LoginModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
          throw Exception('Failed to load album');
    }
  }



}