import 'package:app/features/shared/data/models/medicine_model.dart';

abstract class MedicineRepository{
  Future<void> addMedicine(MedicineModel addMedicineModel, String uid);
}