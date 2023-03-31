import 'package:app/features/medicine/domain/repository/medicine_repository.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/domain/repository/timeline_repository.dart';
import 'package:collection/collection.dart';
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

    //fetching medicine from online server
    final dosesFetched = medicines
        .map((e) => DoseModel(medicineModel: e, doseStatus: DoseEnums.pending))
        .sortedByCompare(
            (element) => element.medicineModel.time, (a, b) => a.compareTo(b));

    //if doesn't have any local data, return online fetch data
    if (!box.containsKey(key)) {
      return dosesFetched;
    }
    List? dosesRaw = box.get(key);
    if (dosesRaw == null) {
      return [];
    }

    //fetching local doses from local database
    final dosesLocal = dosesRaw
        .map((e) => DoseModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    //if new medicine is added in online server, add return new medicine + local database
    for (final doseFetch in dosesFetched) {
      bool hasData = dosesLocal.any(
          (element) => element.medicineModel.id == doseFetch.medicineModel.id);
      if (!hasData) {
        dosesLocal.add(doseFetch);
      }
    }
    //sort by time asc
    final doses = dosesLocal.sortedByCompare(
        (element) => element.medicineModel.time, (a, b) => a.compareTo(b));
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
