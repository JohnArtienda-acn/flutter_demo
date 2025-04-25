import 'dart:math';

import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/bloc/homescreenevent.dart';
import 'package:demo/model/product.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double randomRating = Random().nextDouble() * 5;
    final homeBloc = context.read<HomeScreenBloc>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      height: context.screenSize.height * 0.28,
      width: context.screenSize.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(
              screenSize: context.screenSize,
              imageUrl: product.imageUrl,
              isLiked: product.isLiked),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: mediumFontSize,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: mediumFontSize,
                    color: context.colors.tertiary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        final filled = index < randomRating.floor();
                        final halfFilled = (index < randomRating &&
                            index >= randomRating.floor());

                        return Icon(
                          filled
                              ? Icons.star
                              : halfFilled
                                  ? Icons.star_half
                                  : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart!')));
                        homeBloc..add(AddProduct(product));
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(8.0), // increases touch area
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatefulWidget {
  final Size screenSize;
  final String imageUrl;
  final bool isLiked;

  const ProductImage({
    super.key,
    required this.screenSize,
    required this.imageUrl,
    required this.isLiked,
  });

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  void toggleHeart() => setState(() => isLiked = !isLiked);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenSize.height * 0.16,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox.expand(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
              child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: toggleHeart,
              behavior: HitTestBehavior.translucent,
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
