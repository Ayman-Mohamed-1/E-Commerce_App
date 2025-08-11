import 'package:flutter/cupertino.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
    );
  }
}
