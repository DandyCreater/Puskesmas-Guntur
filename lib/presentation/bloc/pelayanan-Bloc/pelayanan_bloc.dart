import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/model/pelayanan-model/pelayanan_model.dart';

part 'pelayanan_event.dart';
part 'pelayanan_state.dart';

class PelayananBloc extends Bloc<PelayananEvent, PelayananState> {
  PelayananBloc() : super(PelayananInitial()) {
    on<FetchPelayanan>((event, emit) async {
      emit(PelayananLoading());

      final jsonData =
          await rootBundle.loadString("assets/json/pelayanan.json");
      final decodeData = jsonDecode(jsonData);
      var data = OkContentPelayan.fromJson(decodeData["OKContentPelayan"]);

      if (decodeData["ResponseStatus"] == "OK") {
        emit(PelayananLoaded(okContentPelayanan: data));
      } else {
        emit(const PelayananFailed(message: "Fetch Pelayanan Error"));
      }
    });
  }
}
