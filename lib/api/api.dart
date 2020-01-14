import 'package:dio/dio.dart';
import 'package:flutter_architecture/api/api_response.dart';
import 'package:flutter_architecture/api/interceptor.dart';
import 'package:flutter_architecture/utils/local_storage_utils.dart';

enum ApiMethod { POST, GET, PUT, PATCH }

class Api {
  static const BASE_URL = 'https://www.googleapis.com/books/v1';
  static const CONNECT_TIMEOUT = 30000;
  static const RECEIVE_TIMEOUT = 30000;

  /// Headers
  static const CONTENT_TYPE = 'Content-Type';
  static const CONTENT_TYPE_JSON = 'application/json; charset=utf-8';
  static const AUTHORIZATION = 'Authorization';

  /// Http status code
  static const HTTP_STATUS_CODE_SUCCESS_200 = 200;
  static const HTTP_STATUS_CODE_SUCCESS_201 = 201;
  static const HTTP_STATUS_CODE_SUCCESS_202 = 202;

  Api();

  static Dio httpClient;

  static Dio get instance {
    if (httpClient == null) {
      Map<String, dynamic> headers = Map();
      headers.putIfAbsent(CONTENT_TYPE, () => CONTENT_TYPE_JSON);

      BaseOptions options = new BaseOptions(
          baseUrl: BASE_URL,
          connectTimeout: 30000,
          receiveTimeout: 30000,
          headers: headers);

      Api.httpClient = Dio(options);
    }
    Api.httpClient.interceptors.add(ApiInterceptor());
    return Api.httpClient;
  }

  Future<ApiResponse> doPost(String url,
      {Map<String, dynamic> data, Options options}) async {
    return makeApiRequest(url, ApiMethod.POST, params: data, options: options);
  }

  Future<ApiResponse> doGet(String url,
      {Map<String, dynamic> data, Options options}) async {
    return makeApiRequest(url, ApiMethod.GET, params: data, options: options);
  }

  Future<ApiResponse> doPut(String url,
      {Map<String, dynamic> data, Options options}) async {
    return makeApiRequest(url, ApiMethod.PUT, params: data, options: options);
  }

  Future<ApiResponse> doPatch(String url,
      {Map<String, dynamic> data, Options options}) async {
    return makeApiRequest(url, ApiMethod.PATCH, params: data, options: options);
  }

  Future<ApiResponse> makeApiRequest(String url, ApiMethod apiMethod,
      {Map<String, dynamic> params, Options options}) async {
    ApiResponse apiResponse;

    /// If the options is not passed, create a default options (with Authorization: $token)
    Options requestOptions = options ?? await createDefaultOptions();
    try {
      Response response;

      switch (apiMethod) {
        case ApiMethod.POST:
          response = await Api.instance
              .post(url, data: params, options: requestOptions);
          break;
        case ApiMethod.GET:
          response = await Api.instance
              .get(url, queryParameters: params, options: requestOptions);
          break;
        case ApiMethod.PUT:
          response = await Api.instance
              .put(url, data: params, options: requestOptions);
          break;
        case ApiMethod.PATCH:
          response = await Api.instance
              .patch(url, data: params, options: requestOptions);
          break;
      }

      if (response.statusCode == Api.HTTP_STATUS_CODE_SUCCESS_200 ||
          response.statusCode == Api.HTTP_STATUS_CODE_SUCCESS_201 ||
          response.statusCode == Api.HTTP_STATUS_CODE_SUCCESS_202) {
        apiResponse = ApiResponse(success: true, rawData: response.data, apiError: null);
      } else {
        apiResponse = ApiResponse(success: false, rawData: response.data, apiError: null);
      }
      return apiResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
      }
      return ApiResponse(
          success: false,
          model: null,
          apiError: ApiError(e.response != null ? e.response.statusCode : 0,
              parseErrorMessage(e.response)));
    }
  }

  /// Create the default request options.
  /// For almost the api calls, we need to put the access token to header.
  /// This method saves us time not to repeat adding token to header for every api call.
  Future<Options> createDefaultOptions() async {
    String token = await getUserTokenFromLocalStorage();
    if (token != null) {
      return Options(
        headers: {
          Api.AUTHORIZATION: token,
        },
      );
    }

    return Options();
  }

  /// Parse error message
  String parseErrorMessage(Response response) {
    return 'Implement parsing error message here!!!';
  }
}
