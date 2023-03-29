import 'package:app/features/shared/models/medicine_model.dart';
import 'package:app/features/add_medicine/domain/repository/add_medicine_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final AddMedicineRepository repository;
  AddMedicineBloc(this.repository) : super(const AddMedicineUpdated()) {
    on<CategoryChange>((event, emit) {
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;

      emit(stateUpdated.copyWith(
        medicineCategoryIndex: event.categoryIndex,
        medicineCategoryName: event.categoryName
      ));
    });

    on<MedicineNameChange>((event, emit){
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(stateUpdated.copyWith(
        medicineName: event.medicineName
      ));
    });

    on<DoseChange>((event, emit){
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(stateUpdated.copyWith(
        dose: double.tryParse(event.dose)??0
      ));
    });

    on<DoseTypeChange>((event, emit){
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(stateUpdated.copyWith(
        doseType: event.doseType
      ));
    });

    on<StomachChange>((event, emit){
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(stateUpdated.copyWith(
        stomach: event.stomach
      ));
    });

    on<TimeChange>((event, emit){
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(stateUpdated.copyWith(
        time: event.time
      ));
    });

    on<CommentsChange>((event, emit){
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(stateUpdated.copyWith(
        comments: event.comments
      ));
    });

    on<AddMedicine>((event, emit) async {
      if(state is! AddMedicineUpdated){
        return;
      }
      final stateUpdated = state as AddMedicineUpdated;
      emit(AddMedicineLoading());
      if(stateUpdated.medicineCategoryIndex==null||stateUpdated.medicineCategoryIndex!<0){
        emit(const AddMedicineError(message: "Invalid values or missing values"));
        emit(stateUpdated);
        return;
      }
      if (
        stateUpdated.medicineCategoryIndex==null||
        stateUpdated.medicineCategoryIndex!<0||
        !event.formKey.currentState!.validate()
      ) {
        emit(const AddMedicineError(message: "Invalid values or missing values"));
        emit(stateUpdated);
        return;
      }
      MedicineModel addMedicineModel = MedicineModel(
        medicineCategoryIndex: stateUpdated.medicineCategoryIndex!, 
        medicineCategoryName: stateUpdated.medicineCategoryName!, 
        medicineName: stateUpdated.medicineName!, 
        dose: stateUpdated.dose!, 
        doseType: stateUpdated.doseType!, 
        stomach: stateUpdated.stomach!, 
        time: stateUpdated.time!,
        comments: stateUpdated.comments
      );
      await repository.addMedicine(addMedicineModel, event.uid);
      emit(AddMedicineSuccess());
    });

  }
}
