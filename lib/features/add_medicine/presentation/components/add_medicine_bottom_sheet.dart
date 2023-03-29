import 'package:app/core/config/app_config.dart';
import 'package:app/core/validator/validator.dart';
import 'package:app/features/add_medicine/presentation/bloc/add_medicine/add_medicine_bloc.dart';
import 'package:app/features/add_medicine/presentation/components/text_field_add_medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMedicineBloc(),
      child: const AddMedicineBottomSheetView(),
    );
  }
}

class AddMedicineBottomSheetView extends StatelessWidget {
  const AddMedicineBottomSheetView({super.key});

  final List<Map<String, dynamic>>  medicineTypes = const [
    {
      "index": 0,
      "img": "assets/icons/capsule.png",
      "title": "Capsule"
    },
    {
      "index": 1,
      "img": "assets/icons/capsule 2.png",
      "title": "Pills"
    },
    {
      "index": 2,
      "img": "assets/icons/capsule 3.png",
      "title": "Eyedrops"
    },
    {
      "index": 3,
      "img": "assets/icons/capsule 4.png",
      "title": "Liquid"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final appTheme = AppConfig.of(context).appTheme;
    return BlocListener<AddMedicineBloc, AddMedicineState>(
      listener: (context, state) {
        if(state is AddMedicineError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message))
          );
        }
        if(state is AddMedicineSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Success"))
          );
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      return GestureDetector(
                        onTap: (){
                          context.read<AddMedicineBloc>().add(
                            CategoryChange(
                              categoryName: medicineType['title']!, 
                              categoryIndex: medicineType["index"]!
                            )
                          );
                        },
                        child: Column(
                          children: [
                            BlocBuilder<AddMedicineBloc, AddMedicineState>(
                              buildWhen: (previous, current) {
                                return current is AddMedicineUpdated;
                              },
                              builder: (context, state) {
                                if(state is! AddMedicineUpdated){
                                  return const SizedBox();
                                }
                                return Container(
                                  decoration: BoxDecoration(
                                    color: appTheme.colorTertiary,
                                    borderRadius: BorderRadius.circular(20),
                                    border: state.medicineCategoryIndex == medicineType["index"]!?
                                      Border.all(color: appTheme.colorPrimary):
                                      null
                                  ),
                                  height: 0.20.sw,
                                  width: 0.20.sw,
                                  padding: EdgeInsets.all(12.w),
                                  child: Image.asset(medicineType['img']!),
                                );
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              medicineType['title']!
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  TextFieldAddMedicine(
                    label: "Medicine name",
                    validator: Validator.validateFullname,
                    onChange: (value) {
                      context.read<AddMedicineBloc>().add(
                        MedicineNameChange(medicineName: value)
                      );
                    },
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldAddMedicine(
                          label: "Dose",
                          validator: Validator.validateDose,
                          onChange: (value) {
                            context.read<AddMedicineBloc>().add(
                              DoseChange(dose: value)
                            );
                          },
                        )
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Expanded(
                        child: TextFieldAddMedicine(
                          label: "Type",
                          validator: Validator.validateNonull("Type"),
                          dropList: const <String>[
                            "Tabs",
                            "Spoon"
                          ],
                          onChange: (value) {
                            context.read<AddMedicineBloc>().add(
                              DoseTypeChange(doseType: value)
                            );
                          },
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
                      Flexible(
                        child: TextFieldAddMedicine(
                          label: "Stomach",
                          validator: Validator.validateNonull("Stomach"),
                          dropList: const <String>[
                            "After eat",
                            "Before eat"
                          ],
                          onChange: (value) {
                            context.read<AddMedicineBloc>().add(
                              StomachChange(stomach: value)
                            );
                          },
                        )
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Flexible(
                        child: TextFieldAddMedicine(
                          label: "Time",
                          validator: Validator.validateNonull("Time"),
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
                          onChange: (value) {
                            context.read<AddMedicineBloc>().add(
                              TimeChange(time: value)
                            );
                          },
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  TextFieldAddMedicine(
                    label: "Comments", 
                    isLarge: true,
                    onChange: (value) {
                      context.read<AddMedicineBloc>().add(
                        CommentsChange(comments: value)
                      );
                    },
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      context.read<AddMedicineBloc>().add(
                        AddMedicine(formKey)
                      );
                    },
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
          ),
        ),
      ),
    );
  }
}