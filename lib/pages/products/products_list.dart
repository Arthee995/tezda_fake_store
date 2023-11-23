import 'package:fake_store/pages/products/product_controller.dart';
import 'package:fake_store/pages/products/products_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());


    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: Obx(() =>
            ListView.builder(
              itemCount: productController.products.value.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: ()
                {
                  productController.fetchProductDetailAPI(id: productController.products.value[index].id).then((value) {
                    Get.to(ProductDetail());
                  });



                },
                child: Card(child: ListTile(
                leading: Image.network(productController.products.value[index].image.toString()),
                title: Text(productController.products.value[index].title ?? ''),
                subtitle: Text(productController.products.value[index].price.toString()),
                trailing: IconButton(
                  onPressed: (){
                    productController.selectFav.value = !productController.selectFav.value;
                    print("productController.selectFav.value ${productController.selectFav.value}");
                  },
                  icon: Obx(() => Icon(productController.selectFav.value == true ? Icons.favorite : Icons.favorite_border)),
                ),),
                ));
              },
            ),)
    );
  }
}
