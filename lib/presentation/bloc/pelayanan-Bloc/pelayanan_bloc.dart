import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/entity/pelayanan/pelayanan_entity.dart';
import 'package:puskesmas_guntur/domain/usecase/pelayanan/pelayanan_usecase.dart';

part 'pelayanan_event.dart';
part 'pelayanan_state.dart';

class PelayananBloc extends Bloc<PelayananEvent, PelayananState> {
  final PelayananUseCase pelayananUseCase;
  PelayananBloc(this.pelayananUseCase) : super(PelayananInitial()) {
    on<FetchPelayanan>((event, emit) async {
      emit(PelayananLoading());

      try {
        final result = await pelayananUseCase.execute();
        result.fold((failure) {
          emit(PelayananFailed(message: failure.message));
        }, (response) {
          emit(PelayananLoaded(okContentPelayanan: response.okContentPelayan));
        });
      } catch (e) {
        emit(const PelayananFailed(message: "BLOC FETCH PELAYANAN ERROR"));
      }
    });
  }
}
