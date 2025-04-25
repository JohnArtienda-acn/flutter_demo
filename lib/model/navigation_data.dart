
import 'package:demo/model/product.dart';

class NavigationData {
    final List<Product> products;
  final Product selectedProduct;

  NavigationData({
    required this.products,
    required this.selectedProduct,
  });
}