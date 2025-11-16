import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../layout/gap.dart';
import '../../styles/text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TStyles.title.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppGap.v16,
      ],
    );
  }
}
