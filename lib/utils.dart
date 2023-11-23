
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