import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget demoAppBar({
  required BuildContext context,
  String? title,
  bool? isBackEnabled = false,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Row(
      children: [
        Row(
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("harold", style: TextStyle(fontSize: mediumFontSize),),
                Text("Artienda", style: TextStyle(fontSize: mediumFontSize),)
              ],
            )
          ],
        ),
        Expanded(child: SizedBox()),
        Icon(Icons.share)
      ],
    ),
  );
}
