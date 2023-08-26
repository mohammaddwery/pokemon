import 'package:dio/dio.dart';

class ApiErrorHandler {
  const ApiErrorHandler();
  void onError(DioError dioError,) {
    switch (dioError.type) {
      case DioErrorType.response:
        handleApiResponseError(dioError.response!);
        break;

      case DioErrorType.other:
        throw const FormatException('connection_error');

      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        throw const FormatException('timeout');

      default: throw const FormatException('something_went_wrong');
    }
  }

  handleApiResponseError(Response? errorResponse) {
    switch(errorResponse?.statusCode) {
      case 404:
        throw const FormatException('no_results_found');

      default: throw const FormatException('something_went_wrong');
    }
  }
}
