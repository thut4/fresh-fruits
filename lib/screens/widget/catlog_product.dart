import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:fresh_fruits/controllers/product_controller.dart';
import 'package:get/get.dart';

import 'catlog_productcard.dart';

class CatlogProduct extends StatelessWidget {
  final productController = Get.put(ProductController());
  CatlogProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Flexible(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                return CatlogProductCard(index: index);
              })),
    );
  }
}
