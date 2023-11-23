import 'package:fake_store/constants/dimensions.dart';
import 'package:fake_store/pages/products/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text("#${productController.product.value.id}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(productController.product.value.image.toString(),fit: BoxFit.fitWidth,),
              SizedBox(height: 10,),
              Text(productController.product.value.title ?? ''),
              SizedBox(height: 5,),

              Text("Price: ${productController.product.value.price.toString()}" ?? '',style: robotoRegular.copyWith(color: AppColors.kBlue),),
              SizedBox(height: 5,),

              Text(productController.product.value.description ?? '',style: robotoRegular.copyWith(color: AppColors.kGrey),),
            ],
          ),
        ),
      ),
    );
  }
}
