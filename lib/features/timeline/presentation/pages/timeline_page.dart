import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/add_medicine/presentation/components/add_medicine_bottom_sheet.dart';
import 'package:app/features/home/presentation/components/medicine_list.dart';
import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/shared/components/horz_calender.dart';
import 'package:app/features/timeline/presentation/components/dashed_line_vertical_line.dart';
import 'package:app/features/timeline/presentation/components/schedule_atom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  late List<MedicineModel> medicineModels;

  @override
  void initState() {
    medicineModels = [
      MedicineModel(
          medicineCategoryIndex: 0,
          medicineCategoryName: "Capsule",
          medicineName: "Zincovit CL",
          dose: 2,
          doseType: "Spoon",
          stomach: "After meal",
          time: DateTime.now()),
      MedicineModel(
          medicineCategoryIndex: 0,
          medicineCategoryName: "Capsule",
          medicineName: "Zincovit CL",
          dose: 2,
          doseType: "Spoon",
          stomach: "After meal",
          time: DateTime.now()),
      MedicineModel(
          medicineCategoryIndex: 0,
          medicineCategoryName: "Capsule",
          medicineName: "Zincovit CL",
          dose: 2,
          doseType: "Spoon",
          stomach: "After meal",
          time: DateTime.now().add(const Duration(hours: 1))),
    ];
    super.initState();
  }

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
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      AddMedicineBottomSheet.show(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: appTheme.colorPrimary,
                      textStyle: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    child: const Text("Add +"),
                  )
                ],
              ),
            ),
            Flexible(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ListView.separated(
                    itemCount: medicineModels.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.15.sw,
                          ),
                          SizedBox(
                              width: 1,
                              height: 12.h,
                              child: const DashedLineVerticalLine()),
                          SizedBox(
                            width: 0.6.sw,
                          ),
                        ],
                      );
                    },
                    itemBuilder: (context, index) {
                      return ScheduleAtomItem(
                        isFirstItem: index == 0,
                        isLastItem: index == medicineModels.length - 1,
                        medicineModel: medicineModels[index],
                        prevMedicineModel:
                            index > 0 ? medicineModels[index - 1] : null,
                      );
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
