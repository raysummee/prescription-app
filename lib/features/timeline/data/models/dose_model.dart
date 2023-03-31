import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/timeline/data/enums/dose_enums.dart';
import 'package:equatable/equatable.dart';

class DoseModel extends Equatable {
  final MedicineModel medicineModel;
  final DoseEnums doseStatus;

  const DoseModel({required this.medicineModel, required this.doseStatus});

  @override
  List<Object?> get props => [medicineModel, doseStatus];
}
