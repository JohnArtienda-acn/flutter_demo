import 'dart:math';

import 'package:demo/utils/constants.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final bool isLiked;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isLiked,
  });

  // Factory constructor to create a Product from a JSON object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: imageOptions[Random().nextInt(imageOptions.length)],
      price: (json['price'] as num).toDouble(),
      isLiked: json['isLiked'] as bool,
    );
  }
}
