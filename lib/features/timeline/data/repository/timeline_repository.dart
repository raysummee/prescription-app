import 'package:app/features/medicine/domain/repository/medicine_repository.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/domain/repository/timeline_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../enums/dose_enums.dart';

class TimelineRepositoryImpl extends TimelineRepository {
  final MedicineRepository _medicineRepository;
  TimelineRepositoryImpl(this._medicineRepository);

  final _databaseName = "doses_v1";

  @override
  Future<List<DoseModel>> fetchDoses(String uid, DateTime selectedDate) async {
    final medicines = await _medicineRepository.getUseMedicines(uid);
    final box = await Hive.openBox(_databaseName);
    final key =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
            .toString();
    if (!box.containsKey(key)) {
      final doses = medicines
          .map(
              (e) => DoseModel(medicineModel: e, doseStatus: DoseEnums.pending))
          .toList();
      return doses;
    }
    List? dosesRaw = box.get(key);
    if (dosesRaw == null) {
      return [];
    }
    final doses = dosesRaw
        .map((e) => DoseModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return doses;
  }

  @override
  Future<void> updateDoses(
      String uid, DateTime selectedDate, List<DoseModel> doses) async {
    final box = await Hive.openBox(_databaseName);
    final key =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
            .toString();
    await box.put(key, doses.map((e) => e.toJson()).toList());
  }
}
