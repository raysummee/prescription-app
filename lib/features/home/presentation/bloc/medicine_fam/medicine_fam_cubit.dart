import 'package:app/features/home/data/models/medicine_fam.dart';
import 'package:app/features/home/domain/repository/medicine_fam_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'medicine_fam_state.dart';

class MedicineFamCubit extends Cubit<MedicineFamState> {
  MedicineFamCubit(this._repository) : super(MedicineFamInitial());
  final MedicineFamRepository _repository;

  getUserMedicine() async {
    try {
      emit(MedicineLoading());
      final medicines = await _repository.fetchMedicineFam();
      emit(MedicineSuccess(medicines: medicines));
    } catch (err) {
      emit(MedicineFailed());
    }
  }
}
