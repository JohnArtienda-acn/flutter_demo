import 'package:demo/model/product.dart';

abstract class FireStoreHelper {

  Future<List<Product>> getProducts();
  Future<List<String>> getCategories();
  Future<void> likeProduct(String id);

}