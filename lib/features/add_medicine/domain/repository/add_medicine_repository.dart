import 'package:app/features/shared/models/medicine_model.dart';

abstract class AddMedicineRepository{
  Future<void> addMedicine(MedicineModel addMedicineModel, String uid);
}