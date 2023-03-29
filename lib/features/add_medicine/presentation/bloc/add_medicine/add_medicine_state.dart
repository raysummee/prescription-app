part of 'add_medicine_bloc.dart';

abstract class AddMedicineState extends Equatable {
  const AddMedicineState();
  
  @override
  List<Object?> get props => [];
}

class AddMedicineLoading extends AddMedicineState {}

class AddMedicineSuccess extends AddMedicineState {}

class AddMedicineError extends AddMedicineState {
  final String message;
  const AddMedicineError({
    required this.message,
  });
}


class AddMedicineUpdated extends AddMedicineState {
  final int? medicineCategoryIndex;
  final String? medicineCategoryName;
  final String? medicineName;
  final double? dose;
  final String? doseType;
  final String? stomach;
  final DateTime? time;
  final String? comments;
  
  const AddMedicineUpdated({
    this.medicineCategoryIndex,
    this.medicineCategoryName,
    this.medicineName,
    this.dose,
    this.doseType,
    this.stomach,
    this.time,
    this.comments,
  });


  @override
  List<Object?> get props => [
    medicineCategoryIndex,
    medicineCategoryName,
    medicineName,
    dose,
    doseType,
    stomach,
    time,
    comments
  ];

  AddMedicineUpdated copyWith({
    int? medicineCategoryIndex,
    String? medicineCategoryName,
    String? medicineName,
    double? dose,
    String? doseType,
    String? stomach,
    DateTime? time,
    String? comments,
  }) {
    return AddMedicineUpdated(
      medicineCategoryIndex: medicineCategoryIndex ?? this.medicineCategoryIndex,
      medicineCategoryName: medicineCategoryName ?? this.medicineCategoryName,
      medicineName: medicineName ?? this.medicineName,
      dose: dose ?? this.dose,
      doseType: doseType ?? this.doseType,
      stomach: stomach ?? this.stomach,
      time: time ?? this.time,
      comments: comments ?? this.comments,
    );
  }

  @override
  String toString() {
    return 'AddMedicineUpdated(medicineCategoryIndex: $medicineCategoryIndex, medicineCategoryName: $medicineCategoryName, medicineName: $medicineName, dose: $dose, doseType: $doseType, stomach: $stomach, time: $time, comments: $comments)';
  }
}

