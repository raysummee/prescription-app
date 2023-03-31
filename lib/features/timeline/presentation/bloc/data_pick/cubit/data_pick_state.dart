part of 'data_pick_cubit.dart';

abstract class DatePickState extends Equatable {
  const DatePickState(
    this.selectedDate,
  );
  final DateTime selectedDate;
  @override
  List<Object> get props => [];
}

class DatePickSelected extends DatePickState {
  const DatePickSelected(super.selectedDate);
  @override
  List<Object> get props => [selectedDate];
}
