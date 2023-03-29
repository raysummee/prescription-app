import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/config/app_config.dart';

class DoseListShimmer extends StatelessWidget {
  const DoseListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return SizedBox(
      height: 0.5.sw,
      child: ListView.separated(
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300, 
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.colorAccentPrimary,
                borderRadius: BorderRadius.circular(28.w),
                border: Border.all(
                  color: appTheme.colorShadow
                )
              ),
              width: 0.4.sw,
              height: 0.5.sw,
            )
          );
        },
      ),
    );
  }
}