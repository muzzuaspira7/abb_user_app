import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class TStyles {
  static TextStyle title = GoogleFonts.urbanist(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle subtitle = GoogleFonts.urbanist(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle button({Color? color}) => GoogleFonts.urbanist(
        color: color ?? AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle inputHint = GoogleFonts.urbanist(
    fontSize: 14.sp,
    color: Colors.grey.shade600,
  );

  static TextStyle smallText = GoogleFonts.urbanist(
    fontSize: 12.sp,
    color: AppColors.textDark,
  );
}
