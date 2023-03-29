import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../shared/data/models/medicine_model.dart';
import '../../domain/repository/medicine_repository.dart';
class MedicineRepositoryImpl extends MedicineRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addMedicine(MedicineModel addMedicineModel, String uid) async {
    await _firestore.collection("users").doc(uid).collection("medicine").add(addMedicineModel.toJson());
  }
}