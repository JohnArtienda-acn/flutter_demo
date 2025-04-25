import 'package:demo/model/cart.dart';
import 'package:demo/model/product.dart';
import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final List<Product> products;
  final List<Cart> addedProducts;
  final int homeScreentab;
  final bool isError;
  final bool isLoading;

  const HomeScreenState({
    required this.addedProducts,
    required this.products,
    required this.homeScreentab,
    required this.isError,
    required this.isLoading,
  });

  HomeScreenState copyWith({
    List<Cart>? addedProducts,
    List<Product>? products,
    int? homescreentab,
    bool? isError,
    bool? isLoading,
  }) {
    return HomeScreenState(
      addedProducts: addedProducts ?? this.addedProducts,
      products: products ?? this.products,
      homeScreentab: homescreentab ?? this.homeScreentab,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [products, addedProducts, homeScreentab, isError, isLoading];
}
