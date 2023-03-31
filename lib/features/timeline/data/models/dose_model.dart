import 'package:equatable/equatable.dart';
import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/timeline/data/enums/dose_enums.dart';

class DoseModel extends Equatable {
  final MedicineModel medicineModel;
  final DoseEnums doseStatus;

  const DoseModel({required this.medicineModel, required this.doseStatus});

  @override
  List<Object?> get props => [medicineModel, doseStatus];

  Map<String, dynamic> toJson() =>
      {'medicineModel': medicineModel.toJson(), 'doseStatus': doseStatus.index};

  factory DoseModel.fromJson(Map<String, dynamic> json) {
    return DoseModel(
      medicineModel: MedicineModel.fromJson(
          Map<String, dynamic>.from(json['medicineModel'])),
      doseStatus: DoseEnums.values[json['doseStatus']],
    );
  }

  DoseModel copyWith({
    MedicineModel? medicineModel,
    DoseEnums? doseStatus,
  }) {
    return DoseModel(
      medicineModel: medicineModel ?? this.medicineModel,
      doseStatus: doseStatus ?? this.doseStatus,
    );
  }
}
