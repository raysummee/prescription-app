import 'package:app/features/add_medicine/data/models/add_medicine_model.dart';

abstract class AddMedicineRepository{
  Future<void> addMedicine(AddMedicineModel addMedicineModel, String uid);
}