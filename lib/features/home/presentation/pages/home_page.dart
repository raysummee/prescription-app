import 'package:app/features/home/data/repository/medicine_fam_repository.dart';
import 'package:app/features/home/presentation/bloc/home/home_cubit.dart';
import 'package:app/features/home/presentation/components/dose_list.dart';
import 'package:app/features/home/presentation/components/dose_list_shimmer.dart';
import 'package:app/features/login/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:app/features/medicine/data/repository/medicine_repository.dart';
import 'package:app/features/shared/components/horz_calender.dart';
import 'package:app/features/home/presentation/components/medicine_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/medicine_fam/medicine_fam_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MedicineFamRepositoryImpl(),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is! AuthenticationSuccess) {
            return const SizedBox();
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    HomeCubit(context.read<MedicineRepositoryImpl>())
                      ..getUserMedicine(state.uid),
              ),
              BlocProvider(
                create: (context) =>
                    MedicineFamCubit(context.read<MedicineFamRepositoryImpl>())
                      ..getUserMedicine(),
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Text(
                "Medicines Doses",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: HorzCalender(
                onDateClick: (dateTime) {},
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is! HomeSuccess) {
                  return const DoseListShimmer();
                }
                if (state.medicines.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: const Center(
                        child: Text(
                      "Nothing here now!!\n Added medicines will be shown here",
                      textAlign: TextAlign.center,
                    )),
                  );
                }
                return DoseList(medicines: state.medicines);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Text(
                "Most Popular Product",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const MedicineList(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
