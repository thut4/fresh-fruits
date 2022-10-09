import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  const Product(
      {required this.name, required this.price, required this.imageUrl});

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product products = Product(
        name: snap['name'], price: snap['price'], imageUrl: snap['imageUrl']);
    return products;
  }
  // static const List<Product> products = [
  //   Product(
  //       name: 'Apple',
  //       price: 2.99,
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
  //   Product(
  //       name: 'Orange',
  //       price: 1.99,
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1587735243615-c03f25aaff15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
  //   Product(
  //       name: 'Grape',
  //       price: 1.99,
  //       imageUrl:
  //           'https://img.freepik.com/premium-vector/isolated-dark-grape-with-green-leaf_317810-1956.jpg?w=2000'),
  //   Product(
  //       name: 'Mango',
  //       price: 0.99,
  //       imageUrl:
  //           'https://media.istockphoto.com/photos/mango-and-leaf-isolated-white-background-picture-id1019835828?k=20&m=1019835828&s=612x612&w=0&h=-ecU5hgNci34jS0jiKGgyPiQTyDeTcahMhdtSTDm30M='),
  // ];
}
