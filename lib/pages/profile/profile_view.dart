import 'package:fake_store/constants/colors.dart';
import 'package:fake_store/constants/dimensions.dart';
import 'package:fake_store/pages/profile/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fake_store/pages/profile/profile_controller.dart';

import '../../constants/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Users",style: robotoBold.copyWith(color: AppColors.kBlack,fontSize: Dimensions.fontSizeLarge),),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: profileController.users.value.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Row(
                  children: [
                    Icon(Icons.perm_identity,size: 15,),
                    SizedBox(width: 5,),

                    Text(
                        "${profileController.users.value[index].name?.firstname} ${profileController.users.value[index].name?.lastname}" ??
                            ''),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.phone,size: 15,),SizedBox(width: 5,),
                    Text(profileController.users.value[index].phone.toString()),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.to(ProfileUpdate(
                      id: profileController.users.value[index].id,
                      email: profileController.users.value[index].email,
                      firstName: profileController.users.value[index].name?.firstname,
                      lastName: profileController.users.value[index].name?.lastname,
                      phoneNumber: profileController.users.value[index].phone,
                    ))?.whenComplete(() => profileController.fetchUsersAPI());
                  },
                  icon: Icon(Icons.edit,size: 20,color: AppColors.kBlue,),
                ),
              ));
            },
          ),
        ));
  }
}
