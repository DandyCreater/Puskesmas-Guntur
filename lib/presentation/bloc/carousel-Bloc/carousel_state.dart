part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

class CarouselInitial extends CarouselState {}

class CarouselLoading extends CarouselState {}

class CarouselLoaded extends CarouselState {
  final OKContentCarouselEntity? okContentCarousel;

  const CarouselLoaded({required this.okContentCarousel});

  @override
  // TODO: implement props
  List<Object> get props => [okContentCarousel!];
}

class CarouselFailed extends CarouselState {
  final String? message;

  const CarouselFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
