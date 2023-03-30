import 'package:app/core/config/app_config.dart';
import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DoseList extends StatelessWidget {
  const DoseList({super.key, required this.medicines});
  final List<MedicineModel> medicines;
  final List<Map<String, String>> medicineTypes = const [
    {"img": "assets/icons/capsule.png", "title": "Capsule"},
    {"img": "assets/icons/capsule 2.png", "title": "Pills"},
    {"img": "assets/icons/capsule 3.png", "title": "Eyedrops"},
    {"img": "assets/icons/capsule 4.png", "title": "Liquid"},
  ];
  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return SizedBox(
      height: 0.5.sw,
      child: ListView.separated(
        itemCount: medicines.length,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return Container(
            width: 0.4.sw,
            height: 0.5.sw,
            decoration: BoxDecoration(
                color: appTheme.colorAccentPrimary,
                borderRadius: BorderRadius.circular(28.w),
                border: Border.all(color: appTheme.colorShadow)),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            "${medicines[index].dose.toInt()}",
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: appTheme.colorPrimary),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              medicines[index].doseType,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: appTheme.colorTextPrimary),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        medicines[index].medicineName,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: appTheme.colorTextPrimary),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        medicines[index].stomach,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: appTheme.colorTextSecondary),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        DateFormat("hh:mm a").format(medicines[index].time),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: appTheme.colorTextPrimary),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 28.w),
                      child: Image.asset(
                        medicineTypes[medicines[index].medicineCategoryIndex]
                            ["img"]!,
                        width: 0.08.sw,
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
