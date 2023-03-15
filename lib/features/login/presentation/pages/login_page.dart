import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/banner.webp",
            height: 0.5.sh,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 29.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.2.sw, right: 22.w),
            child: Text(
              "The App",
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: appTheme.colorSecondary,
                    borderRadius: BorderRadius.circular(9.w)
                  ),
                  alignment: Alignment.center,
                  width: 60.w,
                  height: 60.w,
                  child: Text(
                    "+91",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: appTheme.colorSecondary,
                      borderRadius: BorderRadius.circular(9.w)
                    ),
                    alignment: Alignment.center,
                    height: 60.w,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Phone no",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: appTheme.colorTextSecondary
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 17.w
                        )
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme.colorPrimary,
                elevation: 0.0,
                fixedSize: Size(1.sw, 60.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Next"
              )
            ),
          )
        ],
      ),
    );
  }
}