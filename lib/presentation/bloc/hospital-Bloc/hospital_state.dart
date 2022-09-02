part of 'hospital_bloc.dart';

abstract class HospitalState extends Equatable {
  const HospitalState();

  @override
  List<Object> get props => [];
}

class HospitalInitial extends HospitalState {}

class HospitalLoading extends HospitalState {}

class HospitalLoaded extends HospitalState {
  final OKContentHospital? okContentHospital;

  const HospitalLoaded({required this.okContentHospital});

  @override
  // TODO: implement props
  List<Object> get props => [okContentHospital!];
}

class HospitalFailed extends HospitalState {
  final String? message;

  const HospitalFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
