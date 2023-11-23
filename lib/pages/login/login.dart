import 'package:fake_store/constants/dimensions.dart';
import 'package:fake_store/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                label: Text("Username")
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  label: Text("Password")
              ),
            ),
            ElevatedButton(onPressed: (){
              if(userNameController.text.isNotEmpty && passwordController.text.isNotEmpty){
                loginController.fetchLoginAPI(userName: userNameController.text,password: passwordController.text).then((value) {
                  print("Login response ${value.token}");
                  if(value.token != null){

                    Get.to(Products());
                  }else{
                    showToast(text: "Username or password is incorrect");
                  }

                });
              }else{
                showToast(text: "Please fill all fields");
              }
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
