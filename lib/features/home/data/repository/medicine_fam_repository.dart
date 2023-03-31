import 'package:app/features/home/data/models/medicine_fam.dart';
import 'package:app/features/home/domain/repository/medicine_fam_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineFamRepositoryImpl extends MedicineFamRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<MedicineFam>> fetchMedicineFam() async {
    final medicineRaw = await _firestore.collection("medicines_famous").get();
    final medicineFams =
        medicineRaw.docs.map((e) => MedicineFam.fromQuerySnapshot(e)).toList();
    return medicineFams;
  }
}
