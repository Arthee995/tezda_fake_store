import 'package:fake_store/constants/colors.dart';
import 'package:fake_store/constants/dimensions.dart';
import 'package:fake_store/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../utils.dart';
import '../products/products_list.dart';

class ProfileUpdate extends StatelessWidget {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  const ProfileUpdate(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController firstNameController = TextEditingController(text: firstName);
    TextEditingController lastNameController = TextEditingController(text: lastName);
    TextEditingController phoneController = TextEditingController(text: phoneNumber);

    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      body: DecoratedBox(
        decoration: boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(controller: emailController, decoration: inputDecoration(text: "Email")),
              SizedBox(
                height: 10,
              ),
              TextFormField(controller: firstNameController, decoration: inputDecoration(text: "First Name")),SizedBox(
                height: 10,
              ),
              TextFormField(controller: lastNameController, decoration: inputDecoration(text: "Last Name")),SizedBox(
                height: 10,
              ),
              TextFormField(controller: phoneController, decoration: inputDecoration(text: "Phone")),SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () {
                    Map data = {
                      "email": emailController.text,
                      "name": {"firstname": firstNameController.text, "lastname": lastNameController.text},
                      "phone": phoneController.text
                    };
                    print("profile data $data");

                    profileController.fetchUserUpdateAPI(id: id, data: data).then((value) {
                      print("Profile Update response ${value.phone}");
                      Get.back();
                    });
                  },
                  child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
