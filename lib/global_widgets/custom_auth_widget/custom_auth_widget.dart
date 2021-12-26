import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

Widget customAuthWidget() => Row(
      children: [
        Container(
          width: 150,
          height: 4,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
