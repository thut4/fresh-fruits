import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:fresh_fruits/models/product_model.dart';
import 'package:get/get.dart';

import 'catlog_productcard.dart';

class CatlogProduct extends StatelessWidget {
  const CatlogProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: Product.products.length,
            itemBuilder: (context, index) {
              return CatlogProductCard(index: index);
            }));
  }
}
