import 'package:abb_user_app/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class SpecialOrders extends StatelessWidget {
  final String imageUrl;
  final String? title;
  const SpecialOrders({super.key, required this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 73.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
                        radius: 30.w,
                        backgroundColor: AppColors.accent.withOpacity(0.1),
                        child: Image.asset(
                          imageUrl,
                          width: 40.w,
                        
                        ),
                      ),
                      SizedBox(height: 5.h,),
      
          if (title != null)
            Text(
              title!,
              style: TStyles.smallText,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          
        ],
      ),
    );
  }
}