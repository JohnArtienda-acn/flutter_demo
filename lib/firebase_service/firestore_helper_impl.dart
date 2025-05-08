import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/firebase_service/firestore_helper.dart';
import 'package:demo/model/category.dart';
import 'package:demo/model/product.dart';
import 'package:demo/repository/category_dao.dart';
import 'package:demo/repository/product_dao.dart';

class FireStoreHelperImpl implements FireStoreHelper {
  final ProductDao productDao;
  final CategoryDao categoryDao;

  FireStoreHelperImpl(this.productDao, this.categoryDao);

  @override
  Future<List<Product>> getProducts() async {
    final snapshot = await getFirebaseInstance("products");

    final products = snapshot.docs.map((document) {
      return Product.fromJson(document.data(), id: document.id);
    }).toList();
    await productDao.insertProducts(products);

    return await productDao.getAllProducts();
  }

  @override
  Future<List<String>> getCategories() async {
    final snapshot = await  getFirebaseInstance("categories");

    final categories =  snapshot.docs.map((document) {
      return Category(document.id);
    }).toList();
    
    await categoryDao.insertCategories(categories);
    
    final categoryRepository = await categoryDao.getCategories();
    return categoryRepository.map((category) {return category.category; }).toList();
    // return [];
  }

  @override
  Future<void> likeProduct(String id) async {
    // TODO: implement likeProduct
    throw UnimplementedError();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFirebaseInstance(String name) async {
    final instance = FirebaseFirestore.instance.collection(name);
    return await instance.get();
  }

}
