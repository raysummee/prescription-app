import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_pick_state.dart';

class DatePickCubit extends Cubit<DatePickState> {
  DatePickCubit() : super(DatePickSelected(DateTime.now()));

  selectDate(DateTime dateTime) {
    emit(DatePickSelected(dateTime));
  }
}
