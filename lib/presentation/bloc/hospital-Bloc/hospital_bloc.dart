import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/entity/hospital/hospital_entity.dart';
import 'package:puskesmas_guntur/domain/usecase/hospital/hospital_usecase.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  final HospitalUseCase hospitalUseCase;
  HospitalBloc(this.hospitalUseCase) : super(HospitalInitial()) {
    on<FetchHospital>((event, emit) async {
      emit(HospitalLoading());

      try {
        final result = await hospitalUseCase.execute();

        result.fold((failure) {
          emit(HospitalFailed(message: failure.message));
        }, (response) {
          emit(HospitalLoaded(okContentHospital: response.oKContentHospital));
        });
      } catch (e) {
        emit(const HospitalFailed(message: "BLOC FETCH HOSPITAL ERROR"));
      }
    });
  }
}
