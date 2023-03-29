import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repository/medicine_repository.dart';
import '../models/medicine_model.dart';
class MedicineRepositoryImpl extends MedicineRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addMedicine(MedicineModel addMedicineModel, String uid) async {
    await _firestore.collection("users").doc(uid).collection("medicine").add(addMedicineModel.toJson());
  }
  
  @override
  Future<List<MedicineModel>> getUseMedicines(String uid) async {
    final query = await _firestore.collection("users").doc(uid).collection("medicine").get();
    final medicines = query.docs.map((e) => MedicineModel.fromQueryDocumentSnapshot(e)).toList();
    return medicines;
  }
}