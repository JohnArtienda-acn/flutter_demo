import 'package:demo/utils/extensions.dart';
import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final bool isFilled;
  final bool isEnabled;
  final VoidCallback? onTap;
  const DemoButton(
      {super.key,
      required this.height,
      required this.width,
      this.isFilled = false,
      this.title = "",
      this.isEnabled = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: InkWell(
        onTap: null,
        borderRadius: BorderRadius.circular(50),
        child: MaterialButton(
          onPressed: isEnabled? onTap: null,
          color: isFilled ? context.colors.primary : null,
          textColor: isFilled ? Colors.white : context.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: isFilled
                ? BorderSide.none
                : BorderSide(color: context.colors.primary),
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
