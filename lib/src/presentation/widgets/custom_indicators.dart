import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIndicators extends StatelessWidget {
  const CustomIndicators({Key? key, this.color, this.storkeWidth})
      : super(key: key);

  final Color? color;
  final double? storkeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? primaryColor,
      strokeWidth: storkeWidth ?? 1.8,
    );
  }
}
