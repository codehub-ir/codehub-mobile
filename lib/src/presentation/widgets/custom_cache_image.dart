import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:codehub/src/presentation/widgets/custom_indicators.dart';
import 'package:flutter/material.dart';

class CustomCacheImage extends StatelessWidget {
  const CustomCacheImage({
    Key? key,
    required this.url,
    this.width = 100,
    this.height = 50,
    this.isCircular = false,
  }) : super(key: key);

  final String url;
  final double width, height;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      placeholder: (context, url) => Center(child: CustomIndicators()),
      errorWidget: (context, url, error) => Icon(
        Icons.account_circle_outlined,
        color: primaryColor,
      ),
    );
  }
}
