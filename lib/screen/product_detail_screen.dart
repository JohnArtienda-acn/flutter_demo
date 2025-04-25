import 'dart:math';

import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/bloc/homescreenevent.dart';
import 'package:demo/model/product.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/widgets/demo_button.dart';
import 'package:demo/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  final List<Product> products;
  final Product selectedProduct;
  const ProductDetailScreen(
      {super.key, required this.selectedProduct, required this.products});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final double randomRating = Random().nextDouble() * 5;

  late String _imageSrc;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.selectedProduct.isLiked;
    _imageSrc = widget.selectedProduct.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeScreenBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  height: context.screenHeight * 0.4,
                  width: double.infinity,
                  _imageSrc,
                  fit: BoxFit.cover,
                ),
              ),
              _spacer(),
              SizedBox(
                height: context.screenHeight * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageOptions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: mediumPadding),
                      child: InkWell(
                        onTap: () =>
                            setState(() => _imageSrc = imageOptions[index]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageOptions[index],
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              _spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.selectedProduct.name,
                    style: AppTextStyle.productDetailTitle(),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _isLiked = !_isLiked),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.black,
                        size: 24,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: mediumPadding),
              Row(
                children: List.generate(
                  5,
                  (index) {
                    final filled = index < randomRating.floor();
                    final halfFilled =
                        (index < randomRating && index >= randomRating.floor());

                    return Icon(
                      filled
                          ? Icons.star
                          : halfFilled
                              ? Icons.star_half
                              : Icons.star_border,
                      color: Colors.amber,
                      size: 24,
                    );
                  },
                ),
              ),
              const SizedBox(height: mediumPadding),
              Text(
                "USD: \$${widget.selectedProduct.price}",
                style: AppTextStyle.productDetailTitle(),
              ),
              _spacer(),
              DemoButton(
                isFilled: true,
                height: context.screenHeight * 0.05,
                width: double.infinity,
                title: "Buy Now",
                onTap: () {
                  homeBloc.add(AddProduct(widget.selectedProduct));
                  context.push('/payment');
                },
              ),
              const SizedBox(height: mediumPadding),
              DemoButton(
                isFilled: false,
                height: context.screenHeight * 0.05,
                width: double.infinity,
                title: "Add to Cart",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!')));
                  homeBloc.add(AddProduct(widget.selectedProduct));
                },
              ),
              const SizedBox(height: 24),
              Text(
                "Description",
                style: AppTextStyle.productDetailTitle(),
              ),
              _spacer(),
              Text(
                widget.selectedProduct.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              ProductList(
                  products: widget.products,
                  title: "You may also like",
                  isSeeMoreVisible: false),
              SizedBox(height: context.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacer() => const SizedBox(height: largePadding);
}
