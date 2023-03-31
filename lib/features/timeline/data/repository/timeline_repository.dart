import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/medicine/domain/repository/medicine_repository.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/domain/repository/timeline_repository.dart';

import '../enums/dose_enums.dart';

class TimelineRepositoryImpl extends TimelineRepository {
  final MedicineRepository _medicineRepository;
  TimelineRepositoryImpl(this._medicineRepository);
  @override
  Future<List<DoseModel>> fetchDoses(String uid) async {
    final medicines = await _medicineRepository.getUseMedicines(uid);
    final doses = medicines
        .map((e) => DoseModel(medicineModel: e, doseStatus: DoseEnums.pending))
        .toList();
    return doses;
  }
}
