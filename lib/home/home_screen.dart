import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/bloc/homescreenevent.dart';
import 'package:demo/bloc/homescreenstate.dart';
import 'package:demo/home/cart_screen.dart';
import 'package:demo/home/profile_screen.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/home/widget/category_list.dart';
import 'package:demo/widgets/image_carousel.dart';
import 'package:demo/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildCurrentScreen(HomeScreenState state, int tab) {
    switch (tab) {
      case 0:
        return Home(state: state);
      case 1:
        return CartScreen();
      case 2:
        return ProfileScreen();
      default:
        return Center(child: Text("Unknown tab"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar:
                bottomNavigationBar(context.read<HomeScreenBloc>(), state),
            body: _buildCurrentScreen(state, state.homeScreentab));
      },
    );
  }

  BottomNavigationBar bottomNavigationBar(
      HomeScreenBloc bloc, HomeScreenState state) {
    return BottomNavigationBar(
      currentIndex: state.homeScreentab,
      onTap: (index) => bloc..add(UpdateHomeScreenTab(index)),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Cart",
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.account_circle),
        ),
      ],
    );
  }
}

class Home extends StatelessWidget {
  final HomeScreenState state;

  const Home({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.isError) {
      return const SizedBox(); // Or show an error message here
    } else if (state.products.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ImageCarousel(imagePaths: imageOptions),
            const SizedBox(height: mediumPadding),
            searchBar(),
            CategoryList(category: categories),
            const SizedBox(height: mediumPadding),
            ProductList(products: state.products, title: "Featured"),
            const SizedBox(height: mediumPadding),
            ProductList(products: state.products, title: "Most Popular"),
            const SizedBox(height: mediumPadding),
            ProductList(products: state.products, title: "New to You"),
            SizedBox(height: context.screenHeight * 0.05),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        onChanged: (string) => {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
