import 'package:flutter/material.dart';

import 'widget/cart_product.dart';
import 'widget/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          CartProduct(),
          CartTotal(),
        ],
      ),
    );
  }
}
