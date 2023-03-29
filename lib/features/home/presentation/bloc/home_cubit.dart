import 'package:app/features/medicine/data/models/medicine_model.dart';
import 'package:app/features/medicine/domain/repository/medicine_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeInitial());
  final MedicineRepository _repository;

  getUserMedicine(String uid) async {
    try{
      emit(HomeLoading());
      final medicines = await _repository.getUseMedicines(uid);
      emit(HomeSuccess(medicines: medicines));
    }catch(err){
      emit(HomeFailed());
    }
  }
}
