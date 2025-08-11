
// ignore_for_file: file_names

import 'package:app_e_commers/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {super.key, required this.title, required this.iconPath, this.onTap});
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Gap(
            height: 20.h,
          ),
          Row(
            children: [
              iconPath == null
                  ? const SizedBox.shrink()
                  : Image.asset(
                      iconPath,
                      width: 20.w,
                      height: 20.h,
                    ),
              Gap(
                width: 16.w,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
          Gap(
            height: 20.h,
          ),
          Divider(
              color: const Color.fromARGB(255, 136, 134, 134), indent: 40.w),
        ],
      ),
    );
  }
}
