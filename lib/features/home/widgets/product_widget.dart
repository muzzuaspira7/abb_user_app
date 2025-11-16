import 'package:abb_user_app/shared/widgets/layout/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/styles/text_styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final VoidCallback? onAdd;
  final VoidCallback? onTap;
  final String? serves;


  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.onAdd,
    this.onTap,
    this.serves,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PhysicalModel(
        color: AppColors.white, 
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 185.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      image,
                      height: 140.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 140.h,
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: Icon(Icons.broken_image, size: 40.w),
                      ),
                    ),
                  ],
                ),
              ),
      
              AppGap.v12,
      
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      title,
                      style: TStyles.normalTitle.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
      
                    AppGap.v4,
      
                      Text(
                        "Serves: $serves",
                        style: TStyles.smallText.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
      
                   
      
                    AppGap.v12,
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹$price",
                          style: TStyles.normalTitle.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.accent,
                          ),
                        ),
      
                        InkWell(
                          onTap: (){
                             if (onAdd != null) onAdd!();
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              "Add",
                              style: TStyles.smallText.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                  ],
          ),
        ),
      ),
    );
  }
}
