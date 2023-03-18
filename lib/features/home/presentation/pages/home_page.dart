import 'package:app/core/config/app_config.dart';
import 'package:app/features/home/presentation/components/dose_list.dart';
import 'package:app/features/home/presentation/components/home_appbar.dart';
import 'package:app/features/home/presentation/components/horz_calender.dart';
import 'package:app/features/home/presentation/components/medicine_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Text(
                "Medicines Doses",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: const HorzCalender(),
            ),
            SizedBox(
              height: 30.h,
            ),
            const DoseList(),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Text(
                "Most Popular Product",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const MedicineList(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}