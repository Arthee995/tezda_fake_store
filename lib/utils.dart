
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants/colors.dart';

showToast({String? text}){
  Fluttertoast.showToast(
      msg: text ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kRed,
      textColor: AppColors.kWhite,
      fontSize: 16.0
  );

}

BoxDecoration boxDecoration(){
  return const BoxDecoration(
    // Image set to background of the body
    image: DecorationImage(
        image: NetworkImage("https://static.vecteezy.com/system/resources/previews/001/984/861/non_2x/abstract-blue-geometric-circles-overlapping-background-with-light-blue-free-vector.jpg"), fit: BoxFit.fill),
  );
}

InputDecoration inputDecoration ({String? text}){
  return  InputDecoration(label: Text(text ?? ''),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kBlack, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kBlack, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),

  );
}