import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

class ButtonStyles {
  static TextStyle primary({Color? color}) => TextStyle(
        color: color ?? AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      );
}
