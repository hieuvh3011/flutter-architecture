import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print('REQUEST[${options?.method}] => PATH: ${options?.path}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        'RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}');
    print('RESPONSE ---> ${response.data}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}');
    print('ERROR ---> ${err?.response?.data}');
    return super.onError(err);
  }
}
