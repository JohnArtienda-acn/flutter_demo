import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/bloc/homescreenevent.dart';
import 'package:demo/model/cart.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CartCard extends StatelessWidget {
  final Cart? product;
  const CartCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
        final homeBloc = context.read<HomeScreenBloc>();

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(mediumPadding),
      height: context.screenHeight * 0.15,
      width: double.infinity,
      child: Dismissible(
        key: Key(Uuid().v4()),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (_) => homeBloc..add(DeleteCartItem(product!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                height: context.screenHeight * 0.2,
                width: context.screenHeight * 0.15,
                product?.imageSrc ?? "",
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: mediumPadding),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.title ?? "",
                    style: AppTextStyle.cartCardTitle(),
                  ),
                  Text(
                    "\$${product?.price ?? 0}",
                    style: AppTextStyle.cartCardDescription(),
                  ),
                  Spacer(),
                  Text(
                    "Quantity: ${product?.quantity ?? 0}",
                    style: AppTextStyle.cartCardQuantity(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
