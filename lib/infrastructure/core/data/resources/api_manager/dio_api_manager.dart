import 'package:dio/dio.dart';
import 'api_error_handler.dart';
import 'api_manager.dart';

class DioApiManager with ApiManager {
  final Dio _dio;
  final ApiErrorHandler _apiErrorHandler;
  DioApiManager({
    required dio,
    required ApiErrorHandler apiErrorHandler,
  }) : _dio = dio,
        _apiErrorHandler = apiErrorHandler;

  static const String logTag = 'DioApiManager';

  Future<dynamic> _handleApiRequest(Future<Response<dynamic>> request) async {
    try {
      final response = await request;
      return response.data;
    } on DioError catch (e) {
      _apiErrorHandler.onError(e);
    } catch (e) {
      throw const FormatException('something_went_wrong');
    }
  }

  @override
  close({bool force= false}) {
    _dio.close(force: force);
  }

  @override
  Future<dynamic> get({
    required String url,
    Map<String, String?> headers = const {},
  }) => _handleApiRequest(
    _dio.get(url, options: Options(headers: headers,),),
  );
}