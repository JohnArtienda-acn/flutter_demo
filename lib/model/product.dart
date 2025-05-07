import 'dart:ffi';
import 'dart:math';

import 'package:demo/utils/constants.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final bool isLiked;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isLiked,
  });

  factory Product.fromJson(Map<String, dynamic> json, {String? id = ""}) {
    final String price = json['price'];

    return Product(
      id: id,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: imageOptions[Random().nextInt(imageOptions.length)],
      price: double.parse(price),
      isLiked: json['isLiked'] as bool,
    );
  }
}
