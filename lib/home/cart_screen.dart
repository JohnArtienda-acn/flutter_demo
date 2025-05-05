import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/bloc/homescreenstate.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/home/widget/cart_card.dart';
import 'package:demo/widgets/demo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Your Cart/s", style: AppTextStyle.profileTitle()),
              ),
              BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (ctx, state) {
                  if (state.addedProducts.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[400],
                        ),
                        height: context.screenHeight * 0.25,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Empty Cart",
                            style: AppTextStyle.profileTitle(),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: state.addedProducts
                          .map((product) => CartCard(product: product))
                          .toList(),
                    );
                  }
                },
              ),
              SizedBox(height: context.screenHeight * 0.2),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "TOTAL: ",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.cartCardTotalTitle(),
                        ),
                        const SizedBox(height: mediumPadding),
                        BlocBuilder<HomeScreenBloc, HomeScreenState>(
                            builder: (context, state) {
                          final total = state.addedProducts.fold<double>(
                            0.0,
                            (sum, item) => sum + (item.price * item.quantity),
                          );
                          return Text(
                            "\$${total.toStringAsFixed(2)}",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.cartCardTotalValue(),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 8),
                    BlocBuilder<HomeScreenBloc, HomeScreenState>(
                      builder: (context, state) {
                        return DemoButton(
                          height: context.screenHeight * 0.05,
                          width: double.infinity,
                          title: "Checkout",
                          isFilled: true,
                          onTap: state.addedProducts.isNotEmpty
                              ? () => context.push('/payment')
                              : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Empty Cart')));
                                },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
