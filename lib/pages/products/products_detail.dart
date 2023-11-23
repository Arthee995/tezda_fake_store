import 'package:fake_store/pages/products/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail  extends StatelessWidget {
  const ProductDetail ({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Products Detail"),
      ),
      body: Column(
        children: [
          Text(productController.product.value.title ?? ''),
          Text(productController.product.value.description ?? ''),
        ],
      ),
    );
  }
}
