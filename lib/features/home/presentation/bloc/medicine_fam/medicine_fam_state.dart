part of 'medicine_fam_cubit.dart';

abstract class MedicineFamState extends Equatable {
  const MedicineFamState();

  @override
  List<Object> get props => [];
}

class MedicineFamInitial extends MedicineFamState {}

class MedicineLoading extends MedicineFamState {}

class MedicineFailed extends MedicineFamState {}

class MedicineSuccess extends MedicineFamState {
  final List<MedicineFam> medicines;
  const MedicineSuccess({
    required this.medicines,
  });
  @override
  List<Object> get props => [medicines];
}
