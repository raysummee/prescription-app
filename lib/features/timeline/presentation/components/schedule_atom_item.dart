import 'package:app/core/config/app_config.dart';
import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'dashed_line_vertical_line.dart';

class ScheduleAtomItem extends StatelessWidget {
  const ScheduleAtomItem(
      {super.key,
      this.isFirstItem = false,
      this.isLastItem = false,
      required this.medicineModel,
      this.prevMedicineModel});
  final bool isFirstItem;
  final bool isLastItem;
  final MedicineModel medicineModel;
  final MedicineModel? prevMedicineModel;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return Row(
      crossAxisAlignment:
          isFirstItem ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat("h:mm a").format(medicineModel.time),
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: appTheme.colorTextSecondary),
        ),
        SizedBox(
            child: Stack(
          alignment: isFirstItem ? Alignment.topCenter : Alignment.center,
          children: [
            SizedBox(
                width: 1,
                height: isLastItem ? 32.h : 64.h,
                child: const DashedLineVerticalLine()),
            Container(
              height: 15.w,
              width: 15.w,
              decoration: BoxDecoration(
                  color: appTheme.colorSecondary,
                  borderRadius: BorderRadius.circular(50)),
            )
          ],
        )),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color.fromRGBO(231, 244, 235, 1)),
          height: 55.h,
          width: 229.w,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicineModel.medicineName,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${medicineModel.dose} ${medicineModel.doseType}, ${medicineModel.stomach}",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: appTheme.colorTextSecondary),
                    )
                  ],
                ),
              ),
              Image.asset(
                "assets/icons/done.png",
                height: 20.h,
              )
            ],
          ),
        )
      ],
    );
  }
}
