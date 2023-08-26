import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioProvider {
  provide({required String baseUrl, Interceptor? interceptor}) {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    if(interceptor!=null) dio.interceptors.add(interceptor);
    _initDioWithLogInterceptor(dio);

    return dio;
  }

  _initDioWithLogInterceptor(Dio dio) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
      logPrint: (object) => debugPrint(object.toString()),
    ));
  }
}