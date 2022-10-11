import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/firebase_constant.dart';
import 'package:fresh_fruits/screens/cart_screen.dart';
import 'package:get/get.dart';

import 'widget/catlog_product.dart';

class CatlogScreen extends StatelessWidget {
  const CatlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Fruits'),
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                authController.singOut();
              },
              child: const Text(
                'Log Out!',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CatlogProduct(),
            ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Get.to(() => const CartScreen()),
                label: const Text('Go to Cart'))
          ],
        ),
      ),
    );
  }
}
