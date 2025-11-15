import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/button_styles.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double borderRadius;
  final double verticalPadding;
  final Color? textColor;
  final Gradient? gradient;

  const ReusableButton({
    super.key,
    required this.title,
    required this.onTap,
    this.borderRadius = 25.0,
    this.verticalPadding = 8.0,
    this.textColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final Gradient buttonGradient = gradient ??
        const LinearGradient(
          colors: [
            Color(0xFFFFC31D),
            Color(0xFFFFE25C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          gradient: buttonGradient,
        ),
        child: Center(
          child: Text(
            title,
            style: ButtonStyles.primary(color: textColor ?? Colors.black),
          ),
        ),
      ),
    );
  }
}
