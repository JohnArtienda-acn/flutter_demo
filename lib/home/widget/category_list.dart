import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/home/widget/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/homescreenstate.dart';

class CategoryList extends StatelessWidget {
  final List<String> category;
  const CategoryList({super.key, this.category = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text("Categories", style: AppTextStyle.categoryHeader(context)),
        ),
        SizedBox(height: mediumPadding),
        SizedBox(
          height: categoryHeight,
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(builder: (context, state) {
            final int maxVisible = 4;
            final bool hasMore = state.categories.length > maxVisible;

            final List<String> visibleCategories =
            hasMore ? state.categories.sublist(0, maxVisible) : state.categories;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: visibleCategories.length + 1,
              itemBuilder: (ctx, index) {
                if (index < visibleCategories.length) {
                  return CategoryTile(
                    title: state.categories[index],
                    onTap: () => showSnackbar(context, visibleCategories[index]),
                  );
                } else {
                  return CategoryTile(
                    title: "See more",
                    onTap: () => showSnackbar(context, "See more"),
                  );
                }
              },
            );
          }),
        )
      ],
    );
  }

  void showSnackbar(BuildContext context, String title) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Selected $title"),
        duration: Durations.medium4,
      ));
}
