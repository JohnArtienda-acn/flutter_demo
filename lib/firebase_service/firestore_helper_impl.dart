import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/firebase_service/firestore_helper.dart';
import 'package:demo/model/product.dart';

class FireStoreHelperImpl implements FireStoreHelper {
  @override
  Future<List<Product>> getProducts() async {
    final instance = FirebaseFirestore.instance.collection("products");
    final snapshot = await instance.get();

    return snapshot.docs.map((document) {
      return Product.fromJson(document.data(), id: document.id);
    }).toList();
  }

  @override
  Future<void> likeProduct(String id) async {
    // TODO: implement likeProduct
    throw UnimplementedError();
  }
}
