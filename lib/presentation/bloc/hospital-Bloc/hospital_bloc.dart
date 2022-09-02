import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/model/hopsital-model/hospital_model.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalBloc() : super(HospitalInitial()) {
    on<FetchHospital>((event, emit) async {
      emit(HospitalLoading());

      final jsonData = await rootBundle.loadString("assets/json/hospital.json");

      final decodeData = jsonDecode(jsonData);

      var data = OKContentHospital.fromJson(decodeData["OKContentHospital"]);
      print(jsonEncode(data));
      if (decodeData["ResponseStatus"] == "OK") {
        emit(HospitalLoaded(okContentHospital: data));
      } else {
        emit(const HospitalFailed(message: "Fetch Hospital Failed"));
      }
    });
  }
}
