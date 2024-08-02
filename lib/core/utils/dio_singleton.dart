import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wagba/core/constants/api_constants.dart';

class DioSingleton{

  static Dio? _dio;

  DioSingleton._internal();

  static Dio getInstance(){

    return _dio ??= Dio(
      BaseOptions(
        sendTimeout: Duration.zero,
        receiveTimeout: Duration.zero,
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true, // to get XML document to extract status code and message
      )
    )..interceptors.add(InterceptorsWrapper(
      onRequest: (requestOption, requestHandler){
        debugPrint('${requestOption.method} : ${requestOption.uri}');
        return requestHandler.next(requestOption);
      },
      onResponse: (response, responseHandler){
        debugPrint('${response.requestOptions.method}  ${response.requestOptions.uri} = ${response.statusCode}');
        return responseHandler.next(response);
      },
      onError: (exception, handler){
        debugPrint('${exception.requestOptions.uri } GIVE ERROR: ${exception.message} ${exception.error} ${exception.stackTrace}');
      }
    ));
  }
}