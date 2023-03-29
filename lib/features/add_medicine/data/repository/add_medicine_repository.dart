import 'package:app/features/add_medicine/data/models/add_medicine_model.dart';
import 'package:app/features/add_medicine/domain/repository/add_medicine_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMedicineRepositoryImpl extends AddMedicineRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addMedicine(AddMedicineModel addMedicineModel, String uid) async {
    await _firestore.collection("users").doc(uid).collection("medicine").add(addMedicineModel.toJson());
  }
}