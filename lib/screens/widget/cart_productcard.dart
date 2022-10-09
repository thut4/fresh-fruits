import 'package:flutter/material.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int index;
  final int quantity;

  const CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.index,
      required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name)),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: const Icon(Icons.remove_circle)),
          Text('$quantity'),
          IconButton(
              onPressed: () {
                controller.addProducts(product);
              },
              icon: const Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
