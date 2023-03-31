import '../../data/models/medicine_fam.dart';

abstract class MedicineFamRepository {
  Future<List<MedicineFam>> fetchMedicineFam();
}
