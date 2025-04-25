import 'package:demo/model/cart.dart';
import 'package:demo/model/product.dart';

abstract class HomeScreenEvent {}

class GetProducts extends HomeScreenEvent {}

class AddProduct extends HomeScreenEvent {
  final Product product;

  AddProduct(this.product);
}

class DeleteCartItem extends HomeScreenEvent {
  final Cart cart;

  DeleteCartItem(this.cart);
}

class UpdateHomeScreenTab extends HomeScreenEvent {
  final int tab;

  UpdateHomeScreenTab(this.tab);
}

class Payment extends HomeScreenEvent {}
