import 'package:dio/dio.dart';
import 'package:wagba/core/failures/base_failure.dart';

class ServerFailure extends Failure {
 final int statusCode;

  ServerFailure({required super.message, required this.statusCode});

  factory ServerFailure.checkStatusCode({required String message, required int statusCode}) {
    switch (statusCode) {
      case 400:
        return APIBadRequestFailure(
            message: 'Ensure You have a good internet connection, or try later',
            statusCode: 400);
      case 404:
        return APINotFoundFailure(
            message: 'The element you are searching for is not found',
            statusCode: 404);
      case 500:
        return InternalServerFailure(
            message: 'Server is failed, please try later', statusCode: 500);

      default: return ServerFailure(message: "Unknown Server Error", statusCode: statusCode);
    }
  }
}

// these products are subtypes of ServerFailure, server failure will call them depending on the status code
final class APIBadRequestFailure extends ServerFailure {
  APIBadRequestFailure({required super.message, required super.statusCode});
}

final class InternalServerFailure extends ServerFailure {
  InternalServerFailure({required super.message, required super.statusCode});
}

final class APINotFoundFailure extends ServerFailure {
  APINotFoundFailure({required super.message, required super.statusCode});
}


// this is because the API developer will return null in case of no match found
// this is again (first was the 20 ingredients rather than List<String>), bad practice
final class MealSearchHasNoResultFailure extends Failure {
  // for firebase storage
  MealSearchHasNoResultFailure()
      : super(message: "No Meals Matches This Search!");
}

