import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/fire_store.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDb().getAllProducts());
    super.onInit();
  }
}
