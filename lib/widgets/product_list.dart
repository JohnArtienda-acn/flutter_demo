import 'package:demo/model/navigation_data.dart';
import 'package:demo/model/product.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatelessWidget {
  final bool isSeeMoreVisible;
  final String title;
  final List<Product> products;

  const ProductList(
      {super.key,
      this.title = "",
      required this.products,
      this.isSeeMoreVisible = true});

  @override
  Widget build(BuildContext context) {
    final int maxVisible = 4;
    final bool hasMore = products.length > maxVisible;

    final List<Product> visibleProducts =
        hasMore ? products.sublist(0, maxVisible) : products;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyle.categoryHeader(context)),
              Visibility(
                visible: isSeeMoreVisible,
                child: GestureDetector(
                  onTap: () => context.push(
                    '/products',
                    extra: {"title": title, "products": products},
                  ),
                  child: Text(
                    "See more",
                    style: TextStyle(
                      fontSize: mediumFontSize,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: mediumPadding),
        SizedBox(
          height: context.screenSize.height * 0.28,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: visibleProducts.length + 1,
            itemBuilder: (ctx, index) {
              if (index < visibleProducts.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      context.push("/details",
                          extra: NavigationData(
                              products: products,
                              selectedProduct: products[index]));
                    },
                    child: ProductCard(
                      product: products[index],
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
