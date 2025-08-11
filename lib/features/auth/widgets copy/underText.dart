import 'package:flutter/material.dart';

import '../../../core/styling/app_styling.dart';


class UnderText extends StatelessWidget {
  const UnderText({super.key, this.TextOne, this.TextTwo, this.color});
  final String? TextOne;
  final String? TextTwo;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: TextOne,
          style: AppStyles.subtitleStyle,
          children: [
            TextSpan(
              text: TextTwo,
              style: AppStyles.subtitleStyle.copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }
}
