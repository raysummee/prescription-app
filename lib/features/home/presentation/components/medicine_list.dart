import 'package:app/core/config/app_config.dart';
import 'package:app/features/home/data/models/medicine_fam.dart';
import 'package:app/features/home/presentation/components/medicine_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/medicine_fam/medicine_fam_cubit.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return SizedBox(
      height: 0.5.sw,
      width: 1.sw,
      child: BlocBuilder<MedicineFamCubit, MedicineFamState>(
        builder: (context, state) {
          if (state is! MedicineSuccess) {
            return const MedicineListShimmer();
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            itemCount: state.medicines.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 0.36.sw,
                decoration: BoxDecoration(
                    color: appTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(11.w),
                    border: Border.all(color: appTheme.colorShadow, width: 2)),
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
                            borderRadius: BorderRadius.circular(9.w)),
                        padding: EdgeInsets.all(8.w),
                        child: Image.network(state.medicines[index].image),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          state.medicines[index].title,
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "₹ ${state.medicines[index].price}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: appTheme.colorPrimary),
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
          );
        },
      ),
    );
  }
}
