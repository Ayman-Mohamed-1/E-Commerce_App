import 'package:app_e_commers/core/styling/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.title, required this.location});
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined, size: 30.sp, color: Colors.grey),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(location, style: AppStyles.subtitleStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
