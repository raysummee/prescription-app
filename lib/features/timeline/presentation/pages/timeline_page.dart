import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/add_medicine/presentation/components/add_medicine_bottom_sheet.dart';
import 'package:app/features/home/presentation/components/medicine_list.dart';
import 'package:app/features/login/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/medicine/data/repository/medicine_repository.dart';
import 'package:app/features/shared/components/horz_calender.dart';
import 'package:app/features/timeline/data/enums/dose_enums.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/data/repository/timeline_repository.dart';
import 'package:app/features/timeline/presentation/bloc/timeline_cubit.dart';
import 'package:app/features/timeline/presentation/components/dashed_line_vertical_line.dart';
import 'package:app/features/timeline/presentation/components/schedule_atom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          TimelineRepositoryImpl(context.read<MedicineRepositoryImpl>()),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is! AuthenticationSuccess) {
            return const SizedBox();
          }
          return BlocProvider(
            create: (context) =>
                TimelineCubit(context.read<TimelineRepositoryImpl>())
                  ..fetchDose(state.uid),
            child: const TimelineView(),
          );
        },
      ),
    );
  }
}

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});

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
                  child: BlocBuilder<TimelineCubit, TimelineState>(
                    builder: (context, state) {
                      if (state is! TimelineLoaded) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final doseModels = state.doses;
                      return ListView.separated(
                        itemCount: doseModels.length,
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
                            doseModel: doseModels[index],
                            prevDoseModel:
                                index > 0 ? doseModels[index - 1] : null,
                          );
                        },
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
