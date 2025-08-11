// ignore_for_file: file_names

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';

showAnimatedSnackDialog(
  BuildContext context, {
  required String message,
  required AnimatedSnackBarType type,
}) {
  AnimatedSnackBar.material(message ?? "",
          type: type ?? AnimatedSnackBarType.success,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          desktopSnackBarPosition: DesktopSnackBarPosition.topRight)
      .show(context);
}
