import 'dart:math';

import 'package:demo/utils/constants.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CategoryTile({super.key, this.title = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color color1 = colors[Random().nextInt(colors.length)];
    final Color color2 = colors[Random().nextInt(colors.length)];

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
          height: categoryHeight,
          width: categoryWidth,
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: AppTextStyle.categotyTitle(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
