import 'package:abb_user_app/shared/widgets/inputs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> dummyProducts = const [
    {
      'title': 'Hyderabadi Biryani',
      'price': 250,
      'image': 'https://www.amburbandaaribiryani.in/assets/dish2-xXSQahHy.png',
    },
    {
      'title': 'Chicken Biryani',
      'price': 200,
      'image': 'https://www.amburbandaaribiryani.in/assets/dish2-xXSQahHy.png',
    },
    {
      'title': 'Veg Biryani',
      'price': 150,
      'image': 'https://www.amburbandaaribiryani.in/assets/dish2-xXSQahHy.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Good Morning",
              style: TStyles.subtitle,
            ),
            SizedBox(height: 2.h),
            Text(
              "Muzammil",
              style: TStyles.title.copyWith(color: AppColors.textDark),
            )
          ],
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: AppColors.accent.withOpacity(0.7),
                child: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: "Search..",
                prefixIcon: const Icon(Icons.search, color: AppColors.textDark),
              ),
              SizedBox(height: 20.h),
              Text(
                "Recommendations",
                style: TStyles.title.copyWith(fontSize: 22.sp),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyProducts.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final product = dummyProducts[index];
                    return ProductCard(
                      title: product['title'],
                      price: product['price'],
                      image: product['image'],
                      onAdd: () {
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
