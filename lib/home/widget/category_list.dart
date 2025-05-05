import 'package:demo/utils/constants.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/home/widget/category_tile.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<String> category;
  const CategoryList({super.key, this.category = const []});

  @override
  Widget build(BuildContext context) {
    final int maxVisible = 4;
    final bool hasMore = category.length > maxVisible;

    final List<String> visibleCategories =
        hasMore ? category.sublist(0, maxVisible) : category;

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: visibleCategories.length + 1,
            itemBuilder: (ctx, index) {
              if (index < visibleCategories.length) {
                return CategoryTile(
                  title: category[index],
                  onTap: () => showSnackbar(context, visibleCategories[index]),
                );
              } else {
                return CategoryTile(
                  title: "See more",
                  onTap: () => showSnackbar(context, "See more"),
                );
              }
            },
          ),
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
