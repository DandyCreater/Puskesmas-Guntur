import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/model/carousel-model/carousel_model.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitial()) {
    on<FetchCarousel>((event, emit) async {
      emit(CarouselLoading());

      final jsonData = await rootBundle.loadString("assets/json/carousel.json");
      final decodeData = jsonDecode(jsonData);
      var data = OKContentCarousel.fromJson(decodeData["OKContentCarousel"]);

      if (decodeData["ResponseStatus"] == "OK") {
        emit(CarouselLoaded(okContentCarousel: data));
      } else {
        emit(const CarouselFailed(message: "Fetch Carousel Failed"));
      }
    });
  }
}
