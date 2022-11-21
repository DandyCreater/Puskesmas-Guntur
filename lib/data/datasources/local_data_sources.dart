import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/data/model/article/article_model.dart';
import 'package:puskesmas_guntur/data/model/carousel/carousel_model.dart';
import 'package:puskesmas_guntur/data/model/hospital/hospital_model.dart';
import 'package:puskesmas_guntur/data/model/pelayanan/pelayanan_model.dart';

abstract class LocalDataSources {
  Future fetchArticle();
  Future fetchCarousel();
  Future fetchHospital();
  Future fetchPelayanan();
}

class LocalDataSourcesImpl implements LocalDataSources {
  @override
  Future fetchArticle() async {
    try {
      final jsonData = await rootBundle.loadString("assets/json/article.json");
      final dataDecode = jsonDecode(jsonData);
      var data = ArticleModel.fromJson(dataDecode);

      return data;
    } catch (e) {
      return e;
    }
  }

  @override
  Future fetchCarousel() async {
    try {
      final jsonData = await rootBundle.loadString("assets/json/carousel.json");
      final decodeData = jsonDecode(jsonData);
      var data = CarouselModel.fromJson(decodeData);

      return data;
    } catch (e) {
      return e;
    }
  }

  @override
  Future fetchHospital() async {
    try {
      final jsonData = await rootBundle.loadString("assets/json/hospital.json");
      final decodeData = jsonDecode(jsonData);
      var data = HospitalModel.fromJson(decodeData);

      return data;
    } catch (e) {
      return e;
    }
  }

  @override
  Future fetchPelayanan() async {
    try {
      final jsonData =
          await rootBundle.loadString("assets/json/pelayanan.json");
      final decodeData = jsonDecode(jsonData);

      var data = PelayananModel.fromJson(decodeData);

      return data;
    } catch (e) {
      return e;
    }
  }
}
