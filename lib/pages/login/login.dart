import 'package:fake_store/constants/dimensions.dart';
import 'package:fake_store/pages/login/login_controller.dart';
import 'package:fake_store/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils.dart';
import '../products/products_list.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: DecoratedBox(
        decoration: boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(label: Text("Username"),

                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(label: Text("Password")),
              ),
              SizedBox(height: 30,),


              ElevatedButton(
                  onPressed: () {
                    if (userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      loginController
                          .fetchLoginAPI(userName: userNameController.text, password: passwordController.text)
                          .then((value) async {
                        print("Login response ${value.token}");
                        if (value.token != null) {
                          mySharedPreference.setLoginToken("loginToken", value.token!);
                          Get.to(Products());
                        } else {
                          showToast(text: "Username or password is incorrect");
                        }
                      });
                    } else {
                      showToast(text: "Please fill all fields");
                    }
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
