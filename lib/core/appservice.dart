import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/foud_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Apiservice {
  final Dio dio;
  final String baseurl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Apiservice({required this.dio});

  Future<Map<String, dynamic>> getfood() async {
    var resu = await dio.get(baseurl);
    print(resu);
    return resu.data;
  }
}
