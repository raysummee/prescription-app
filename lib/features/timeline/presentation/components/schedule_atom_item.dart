import 'package:app/core/config/app_config.dart';
import 'package:app/features/login/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:app/features/timeline/data/enums/dose_enums.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/presentation/bloc/data_pick/cubit/data_pick_cubit.dart';
import 'package:app/features/timeline/presentation/bloc/timeline/timeline_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'dashed_line_vertical_line.dart';

class ScheduleAtomItem extends StatelessWidget {
  const ScheduleAtomItem(
      {super.key,
      this.isFirstItem = false,
      required this.doseModel,
      this.prevDoseModel});
  final bool isFirstItem;
  final DoseModel doseModel;
  final DoseModel? prevDoseModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [_buildTime(), _buildSeparator(), _buildMedicineCard()],
    );
  }

  Widget _buildTime() {
    return Builder(builder: (context) {
      final appTheme = AppConfig.of(context).appTheme;
      if (prevDoseModel != null &&
          prevDoseModel!.medicineModel.time.minute ==
              doseModel.medicineModel.time.minute &&
          prevDoseModel!.medicineModel.time.hour ==
              doseModel.medicineModel.time.hour) {
        return SizedBox(
          height: 55.h,
          width: 0.15.sw,
        );
      }
      return Container(
        height: 55.h,
        width: 0.15.sw,
        alignment: isFirstItem ? Alignment.topCenter : Alignment.center,
        child: Text(
          DateFormat("h:mm a").format(doseModel.medicineModel.time),
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: appTheme.colorTextSecondary),
        ),
      );
    });
  }

  Widget _buildMedicineCard() {
    return Builder(builder: (context) {
      final appTheme = AppConfig.of(context).appTheme;
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: doseModel.doseStatus.color),
        height: 55.h,
        width: 0.6.sw,
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
                    doseModel.medicineModel.medicineName,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "${doseModel.medicineModel.dose.toStringAsPrecision(2)} ${doseModel.medicineModel.doseType}, ${doseModel.medicineModel.stomach}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: appTheme.colorTextSecondary),
                  )
                ],
              ),
            ),
            if (doseModel.medicineModel.time.isBefore(DateTime.now()))
              GestureDetector(
                onTap: () {
                  final authState = context.read<AuthenticationBloc>().state;
                  final dateState = context.read<DatePickCubit>().state;
                  if (authState is! AuthenticationSuccess) {
                    return;
                  }
                  context.read<TimelineCubit>().updateDose(
                      authState.uid, dateState.selectedDate, doseModel);
                },
                child: Image.asset(
                  doseModel.doseStatus.iconUri,
                  height: 20.h,
                ),
              )
          ],
        ),
      );
    });
  }

  Widget _buildSeparator() {
    return Builder(builder: (context) {
      final appTheme = AppConfig.of(context).appTheme;
      bool isShowDot = true;
      if (prevDoseModel != null &&
          prevDoseModel!.medicineModel.time.minute ==
              doseModel.medicineModel.time.minute &&
          prevDoseModel!.medicineModel.time.hour ==
              doseModel.medicineModel.time.hour) {
        isShowDot = false;
      }
      return SizedBox(
          child: Stack(
        alignment: isFirstItem ? Alignment.topCenter : Alignment.center,
        children: [
          SizedBox(
              width: 1, height: 55.h, child: const DashedLineVerticalLine()),
          if (isShowDot)
            Container(
              height: 15.w,
              width: 15.w,
              decoration: BoxDecoration(
                  color: appTheme.colorSecondary,
                  borderRadius: BorderRadius.circular(50)),
            )
        ],
      ));
    });
  }
}
