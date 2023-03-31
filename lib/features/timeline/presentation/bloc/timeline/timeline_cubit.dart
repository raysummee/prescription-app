import 'package:app/features/timeline/data/enums/dose_enums.dart';
import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/domain/repository/timeline_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit(this._repository) : super(TimelineInitial());
  final TimelineRepository _repository;

  fetchDose(String uid, DateTime selectedDate) async {
    try {
      emit(TimelineLoading());
      final doses = await _repository.fetchDoses(uid, selectedDate);
      emit(TimelineLoaded(doses));
    } on Exception catch (err) {
      emit(TimelineError(err.toString()));
    }
  }

  updateDose(String uid, DateTime selectedDate, DoseModel dose) async {
    if (state is! TimelineLoaded) {
      return;
    }
    final stateLoaded = state as TimelineLoaded;
    final doseList = [...stateLoaded.doses];
    final index = doseList.indexWhere(
        (element) => element.medicineModel.id == dose.medicineModel.id);
    final exisitingDoseType = dose.doseStatus;
    DoseEnums newDoseType;
    switch (exisitingDoseType) {
      case DoseEnums.pending:
        newDoseType = DoseEnums.taken;
        break;
      case DoseEnums.taken:
        newDoseType = DoseEnums.notTaken;
        break;
      case DoseEnums.notTaken:
        newDoseType = DoseEnums.pending;
        break;
    }
    doseList[index] = dose.copyWith(doseStatus: newDoseType);
    emit(TimelineLoaded(doseList));
    await _repository.updateDoses(uid, selectedDate, doseList);
  }
}
