import 'package:demo/model/product.dart';

abstract class FireStoreHelper {

  Future<List<Product>> getProducts();
  Future<void> likeProduct(String id);

}