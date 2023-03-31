import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/config/app_config.dart';

class MedicineListShimmer extends StatelessWidget {
  const MedicineListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return ListView.separated(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 12.w),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 0.36.sw,
              decoration: BoxDecoration(
                  color: appTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(11.w),
                  border: Border.all(color: appTheme.colorShadow, width: 2)),
            ));
      },
    );
  }
}
