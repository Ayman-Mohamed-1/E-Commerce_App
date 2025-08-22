// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../styling/app_styling.dart';


class UnderText extends StatelessWidget {
  const UnderText({super.key, this.textOne, this.textTwo, this.color});
  final String? textOne;
  final String? textTwo;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: textOne,
          style: AppStyles.subtitleStyle,
          children: [
            TextSpan(
              text: textTwo,
              style: AppStyles.subtitleStyle.copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }
}
