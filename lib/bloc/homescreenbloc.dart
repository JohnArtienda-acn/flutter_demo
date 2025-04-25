import 'dart:convert';

import 'package:demo/bloc/homescreenevent.dart';
import 'package:demo/bloc/homescreenstate.dart';
import 'package:demo/model/cart.dart';
import 'package:demo/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc()
      : super(const HomeScreenState(
          products: [],
          addedProducts: [],
          homeScreentab: 0,
          isError: false,
          isLoading: false,
        )) {
    on<GetProducts>(_onGetProducts);
    on<AddProduct>(_addProduct);
    on<DeleteCartItem>(_deleteCartItem);
    on<UpdateHomeScreenTab>(_updateHomeScreenTab);
    on<Payment>(_payment);

    add(GetProducts());
  }

  Future<void> _onGetProducts(
      GetProducts event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      await Future.delayed(Duration(seconds: 2));
      List<Product> products = await _loadProducts();

      emit(
        state.copyWith(
          products: products,
          isError: false,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  void _addProduct(AddProduct event, Emitter<HomeScreenState> emit) {
    print("addProduct Triggered");

    final existingIndex = state.addedProducts.indexWhere(
      (item) => item.title == event.product.name,
    );

    List<Cart> updatedProducts = List<Cart>.from(state.addedProducts);

    if (existingIndex != -1) {
      updatedProducts[existingIndex].increaseQuantity();
    } else {
      final cartItem = Cart(
        title: event.product.name,
        description: event.product.description,
        imageSrc: event.product.imageUrl,
        price: event.product.price,
        quantity: 1,
        isLiked: event.product.isLiked,
      );

      updatedProducts.add(cartItem);
    }

    emit(state.copyWith(addedProducts: updatedProducts));
  }

  void _deleteCartItem(DeleteCartItem event, Emitter<HomeScreenState> emit) {
    final existingIndex = state.addedProducts
        .indexWhere((item) => item.title == event.cart.title);

    if (existingIndex != -1) {
      final updatedCart = List<Cart>.from(state.addedProducts)
        ..removeAt(existingIndex);

      emit(state.copyWith(addedProducts: updatedCart));
    }
  }

  void _updateHomeScreenTab(
      UpdateHomeScreenTab event, Emitter<HomeScreenState> emit) {
    emit(state.copyWith(homescreentab: event.tab));
  }

  void _payment(Payment event, Emitter<HomeScreenState> emit) {
    emit(state.copyWith(addedProducts: []));
  }

  Future<List<Product>> _loadProducts() async {
    try {
      String jsonString = await rootBundle.loadString('assets/products.json');
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Product> products =
          jsonList.map((json) => Product.fromJson(json)).toList();
      return products;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading or parsing JSON: $e');
      }
    }
    return [];
  }
}
