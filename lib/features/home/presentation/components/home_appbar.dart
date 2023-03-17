import 'package:app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: NavigationToolbar(
          trailing: IconButton(
            onPressed: (){}, 
            icon: Image.asset(
              "assets/icons/ri_search-line.png",
              width: 30.w,
            )
          ),
          leading: IconButton(
            onPressed: (){}, 
            icon: Image.asset(
              "assets/icons/healthicons_doctor.png",
              width: 30.w,
            )
          ),
          middle: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Current location",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: appTheme.colorTextSecondary
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15.sp,
                  ),
                  SizedBox(
                    width: 7.sp,
                  ),
                  Text(
                    "Guwahati",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20.sp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}