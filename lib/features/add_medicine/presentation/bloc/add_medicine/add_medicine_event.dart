part of 'add_medicine_bloc.dart';

abstract class AddMedicineEvent extends Equatable {
  const AddMedicineEvent();

  @override
  List<Object> get props => [];
}

class CategoryChange extends AddMedicineEvent {
  final String categoryName;
  final int categoryIndex;
  const CategoryChange({
    required this.categoryName,
    required this.categoryIndex,
  });

  @override
  List<Object> get props => [categoryIndex, categoryName];
}

class MedicineNameChange extends AddMedicineEvent {
  final String medicineName;
  const MedicineNameChange({
    required this.medicineName,
  });

  @override
  List<Object> get props => [medicineName];
}

class DoseChange extends AddMedicineEvent {
  final String dose;
  const DoseChange({
    required this.dose,
  });

  @override
  List<Object> get props => [dose];
}

class DoseTypeChange extends AddMedicineEvent {
  final String doseType;
  const DoseTypeChange({
    required this.doseType,
  });

  @override
  List<Object> get props => [doseType];
}

class StomachChange extends AddMedicineEvent {
  final String stomach;
  const StomachChange({
    required this.stomach,
  });

  @override
  List<Object> get props => [stomach];
}

class TimeChange extends AddMedicineEvent {
  final DateTime time;
  const TimeChange({
    required this.time,
  });

  @override
  List<Object> get props => [time];
}

class CommentsChange extends AddMedicineEvent {
  final String comments;
  const CommentsChange({
    required this.comments,
  });

  @override
  List<Object> get props => [comments];
}

class AddMedicine extends AddMedicineEvent {
  final GlobalKey<FormState> formKey;
  const AddMedicine(this.formKey);
  @override
  List<Object> get props => [formKey];
}

