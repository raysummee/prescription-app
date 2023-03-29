import '../../data/models/medicine_model.dart';

abstract class MedicineRepository{
  Future<void> addMedicine(MedicineModel addMedicineModel, String uid);
  Future<List<MedicineModel>> getUseMedicines(String uid);
}