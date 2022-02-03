import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.colors})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final double width, height, borderRadius;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
