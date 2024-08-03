import 'package:dio/dio.dart';
import 'package:wagba/core/constants/api_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/failures/server_failure.dart';
import 'package:wagba/core/utils/dio_singleton.dart';

final class GeneralDataGetter {
  static final _dio = DioSingleton.getInstance();

  static Future<Map<String, dynamic>> getDataFromServer(
      {required String endPoint,
      Map<String, dynamic>? queryParams}) async {

    try{
      var response = await _dio.get(endPoint,queryParameters: queryParams,);

      if(endPoint != ApiConstants.categoriesEndPoint){
        if(response.data['meals'] == null){
          throw MealSearchHasNoResultFailure();
        }
      }

      if(response.statusCode == 200){
        return response.data;
      }
      if(response.statusCode == 404){
        throw MealSearchHasNoResultFailure();
      }
      throw ServerFailure(message: response.statusMessage?? 'Something went wrong!', statusCode: (response.statusCode)??0);
    }
    on DioException catch(e){
      throw CustomDioFailure(message: e.message ?? "Dio Failure", statusCode: e.response?.statusCode);
    }
    on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: e.toString());
    }

  }
}
