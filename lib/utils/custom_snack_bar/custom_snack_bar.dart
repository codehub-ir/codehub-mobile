import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customSnackBar(BuildContext context, String title, {bool isSuccess = false}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? primaryColor : Colors.red,
        content: Text(
          title,
          style: underlineStyle.copyWith(color: whiteColor),
        ),
      ),
    );
