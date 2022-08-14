part of 'pelayanan_bloc.dart';

abstract class PelayananState extends Equatable {
  const PelayananState();

  @override
  List<Object> get props => [];
}

class PelayananInitial extends PelayananState {}

class PelayananLoading extends PelayananState {}

class PelayananLoaded extends PelayananState {
  final OkContentPelayan? okContentPelayanan;

  const PelayananLoaded({required this.okContentPelayanan});

  @override
  // TODO: implement props
  List<Object> get props => [okContentPelayanan!];
}

class PelayananFailed extends PelayananState {
  final String? message;

  const PelayananFailed({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
