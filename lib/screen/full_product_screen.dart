import 'package:demo/model/navigation_data.dart';
import 'package:demo/model/product.dart';
import 'package:demo/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullProductScreen extends StatelessWidget {
  final String title;
  final List<Product> products;

  const FullProductScreen(
      {super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.76,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.push("/details",
                  extra: NavigationData(
                      products: products, selectedProduct: products[index]));
            },
            child: ProductCard(
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}
