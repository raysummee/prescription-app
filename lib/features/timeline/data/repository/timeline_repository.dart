import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/domain/repository/timeline_repository.dart';

import '../enums/dose_enums.dart';

class TimelineRepositoryImpl extends TimelineRepository {
  @override
  Future<List<DoseModel>> fetchDoses() async {
    return [
      DoseModel(
          medicineModel: MedicineModel(
              medicineCategoryIndex: 0,
              medicineCategoryName: "Capsule",
              medicineName: "Zincovit CL",
              dose: 2,
              doseType: "Spoon",
              stomach: "After meal",
              time: DateTime.now().subtract(const Duration(minutes: 30))),
          doseStatus: DoseEnums.pending),
      DoseModel(
          medicineModel: MedicineModel(
              medicineCategoryIndex: 0,
              medicineCategoryName: "Capsule",
              medicineName: "Zincovit CL",
              dose: 2,
              doseType: "Spoon",
              stomach: "After meal",
              time: DateTime.now()),
          doseStatus: DoseEnums.taken),
      DoseModel(
          medicineModel: MedicineModel(
              medicineCategoryIndex: 0,
              medicineCategoryName: "Capsule",
              medicineName: "Zincovit CL",
              dose: 2,
              doseType: "Spoon",
              stomach: "After meal",
              time: DateTime.now()),
          doseStatus: DoseEnums.notTaken),
      DoseModel(
          medicineModel: MedicineModel(
              medicineCategoryIndex: 0,
              medicineCategoryName: "Capsule",
              medicineName: "Zincovit CL",
              dose: 2,
              doseType: "Spoon",
              stomach: "After meal",
              time: DateTime.now().add(const Duration(hours: 1))),
          doseStatus: DoseEnums.pending),
    ];
  }
}
