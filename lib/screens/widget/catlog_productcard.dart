import 'package:flutter/material.dart';
import 'package:fresh_fruits/controllers/cart_controller.dart';
import 'package:fresh_fruits/controllers/product_controller.dart';
import 'package:get/get.dart';

class CatlogProductCard extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  CatlogProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage:
                NetworkImage(productController.products[index].imageUrl),
            // NetworkImage(productController.products[index].imageUrl),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            productController.products[index].name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
          Expanded(
              child: Text(
            '${productController.products[index].price}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
          IconButton(
              onPressed: () {
                cartController.addProducts(productController.products[index]);
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
