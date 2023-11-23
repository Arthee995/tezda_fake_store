import 'package:fake_store/pages/products/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Obx(() =>
          Text("Dfdf")),
    );
  }
}
