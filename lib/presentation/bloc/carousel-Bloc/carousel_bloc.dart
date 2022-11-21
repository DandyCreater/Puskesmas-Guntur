import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/entity/carousel/carousel_entity.dart';
import 'package:puskesmas_guntur/domain/usecase/carousel/carousel_usecase.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final CarouselUseCase carouselUseCase;
  CarouselBloc(this.carouselUseCase) : super(CarouselInitial()) {
    on<FetchCarousel>((event, emit) async {
      emit(CarouselLoading());
      try {
        final response = await carouselUseCase.execute();

        response.fold((failure) {
          emit(CarouselFailed(message: failure.message));
        }, (response) {
          emit(CarouselLoaded(okContentCarousel: response.oKContentCarousel));
        });
      } catch (e) {
        emit(const CarouselFailed(message: "BLOC FETCH CAROUSEL ERROR"));
      }
    });
  }
}
