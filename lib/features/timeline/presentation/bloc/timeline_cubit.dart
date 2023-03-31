import 'package:app/features/timeline/data/models/dose_model.dart';
import 'package:app/features/timeline/domain/repository/timeline_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit(this._repository) : super(TimelineInitial());
  final TimelineRepository _repository;

  fetchDose(String uid) async {
    try {
      emit(TimelineLoading());
      final doses = await _repository.fetchDoses(uid);
      emit(TimelineLoaded(doses));
    } on Exception catch (err) {
      emit(TimelineError(err.toString()));
    }
  }
}
