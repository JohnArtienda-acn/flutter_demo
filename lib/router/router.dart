import 'package:demo/model/navigation_data.dart';
import 'package:demo/model/product.dart';
import 'package:demo/screen/full_product_screen.dart';
import 'package:demo/screen/home_screen.dart';
import 'package:demo/screen/payment_screen.dart';
import 'package:demo/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (ctx, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: '/details',
      pageBuilder: (ctx, state) {
        final NavigationData args = state.extra as NavigationData;
        return androidStylePage(
            state,
            ProductDetailScreen(
                selectedProduct: args.selectedProduct,
                products: args.products));
      },
    ),
    GoRoute(
      path: '/products',
      pageBuilder: (ctx, state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final List<Product> products = args['products'];
        final String title = args['title'];

        return androidStylePage(
            state, FullProductScreen(title: title, products: products));
      },
    ),
    GoRoute(
      path: '/payment',
      pageBuilder: (ctx, state) {
        return androidStylePage(state, PaymentScreen());
      },
    ),
  ],
);

Page<dynamic> androidStylePage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )),
        child: child,
      );
    },
  );
}
