part of 'timeline_cubit.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();

  @override
  List<Object> get props => [];
}

class TimelineInitial extends TimelineState {}

class TimelineLoading extends TimelineState {}

class TimelineError extends TimelineState {
  final String message;
  const TimelineError(this.message);
  @override
  List<Object> get props => [message];
}

class TimelineLoaded extends TimelineState {
  final List<DoseModel> doses;
  const TimelineLoaded(this.doses);
  @override
  List<Object> get props => [doses];
}
