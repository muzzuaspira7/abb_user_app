import 'package:abb_user_app/core/theme/app_colors.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 0),
      child: DotNavigationBar(
        itemPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.black,
        dotIndicatorColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        marginR: EdgeInsets.zero,

        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home, size: 22.w),
            selectedColor: AppColors.accent,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 22.w),
            selectedColor: AppColors.accent,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.favorite, size: 22.w),
            selectedColor: AppColors.accent,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person, size: 22.w),
            selectedColor: AppColors.accent,
          ),
        ],
      ),
    );
  }
}
