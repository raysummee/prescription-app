import 'package:app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return SizedBox(
      height: 0.5.sw,
      width: 1.sw,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 22.w),              
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 0.36.sw,
            decoration: BoxDecoration(
              color: appTheme.backgroundColor,
              borderRadius: BorderRadius.circular(11.w),
              border: Border.all(
                color: appTheme.colorShadow,
                width: 2
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 0.25.sw,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 238, 239, 1),
                      borderRadius: BorderRadius.circular(9.w)
                    ),
                    padding: EdgeInsets.all(8.w),
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/prescription-ae6a3.appspot.com/o/medicines%2Fpngwing.com-4.png?alt=media&token=974700f4-8a7f-4221-b6f7-abd3c9bef3c5"),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Expanded(
                    child: Text(
                      "Chest-eeze Colds & Flu",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    "₹ 433.00",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: appTheme.colorPrimary
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
      ),
    );
  }
}