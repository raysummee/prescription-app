import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/shared/components/horz_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorzCalender(large: true),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Dosage",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  TextButton(
                    onPressed: (){}, 
                    style: TextButton.styleFrom(
                      foregroundColor: appTheme.colorPrimary,
                      textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    child: const Text("Add +"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}