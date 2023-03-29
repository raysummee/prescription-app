import 'package:app/core/config/app_config.dart';
import 'package:app/features/add_medicine/presentation/components/text_field_add_medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddMedicineBottomSheet extends StatelessWidget {
  const AddMedicineBottomSheet({super.key});

  static show(BuildContext context){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => Container(
        height: 0.85.sh,
        decoration: BoxDecoration(
          color: AppConfig.of(context).appTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const AddMedicineBottomSheet()
      ),
    );
  }

  final medicineTypes = const [
    {
      "img": "assets/icons/capsule.png",
      "title": "Capsule"
    },
    {
      "img": "assets/icons/capsule 2.png",
      "title": "Pills"
    },
    {
      "img": "assets/icons/capsule 3.png",
      "title": "Eyedrops"
    },
    {
      "img": "assets/icons/capsule 4.png",
      "title": "Liquid"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: appTheme.colorSecondary,
                borderRadius: BorderRadius.circular(10)
              ),
              width: 64.w,
              height: 6.h,
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: medicineTypes.map((medicineType) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: appTheme.colorTertiary,
                        borderRadius: BorderRadius.circular(20),
                        // border: e==1?
                        //   Border.all(color: appTheme.colorPrimary):
                        //   null
                      ),
                      height: 0.20.sw,
                      width: 0.20.sw,
                      padding: EdgeInsets.all(12.w),
                      child: Image.asset(medicineType['img']!),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      medicineType['title']!
                    )
                  ],
                );
              }).toList(),
            ),
            SizedBox(
              height: 28.h,
            ),
            const TextFieldAddMedicine(label: "Medicine name"),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                const Expanded(child: TextFieldAddMedicine(label: "Dose")),
                SizedBox(
                  width: 18.w,
                ),
                const Expanded(
                  child: TextFieldAddMedicine(
                    label: "Type",
                    dropList: [
                      "Tabs",
                      "Spoon"
                    ],
                  )
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible(
                  child: TextFieldAddMedicine(
                    label: "Stomach",
                    dropList: [
                      "After eat",
                      "Before eat"
                    ],
                  )
                ),
                SizedBox(
                  width: 18.w,
                ),
                Flexible(
                  child: TextFieldAddMedicine(
                    label: "Time",
                    dropList: List.generate(37, (index) {
                      final now = DateTime.now().copyWith(
                        hour: 6, 
                        minute: 0, 
                        second: 0, 
                        millisecond: 0, 
                        microsecond: 0
                      );
                      return now.add(Duration(minutes: 30*index));
                    }),
                    formatDropList: (val) {
                      return DateFormat("hh:mm a").format(val);
                    },
                  )
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            const TextFieldAddMedicine(label: "Comments", isLarge: true,),
            SizedBox(
              height: 18.h,
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(1.sw, 0.18.sw),
                backgroundColor: appTheme.colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)
                )
              ), 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Icon(
                      Icons.add,
                      size: 28.sp,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}