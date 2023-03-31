import 'package:app/features/timeline/data/models/dose_model.dart';

abstract class TimelineRepository {
  Future<List<DoseModel>> fetchDoses(String uid, DateTime selectedDate);
  Future<void> updateDoses(
      String uid, DateTime selectedDate, List<DoseModel> doses);
}
