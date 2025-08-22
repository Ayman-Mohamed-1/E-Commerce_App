import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtnIcon extends StatelessWidget {
  const CustomBtnIcon({super.key, this.svgPictureIcon});
  final Widget? svgPictureIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 105.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffE8ECF4), width: 1),
        ),
        child: Center(child: svgPictureIcon),
      ),
    );
  }
}
