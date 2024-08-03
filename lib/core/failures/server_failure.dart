import 'package:dio/dio.dart';
import 'package:wagba/core/failures/base_failure.dart';

class ServerFailure extends Failure{
  final int statusCode;
  const ServerFailure({required super.message, required this.statusCode});

}

// this is because the API developer will return null in case of no match found
// this is again (first was the 20 ingredients rather than List<String>), bad practice
final class MealSearchHasNoResultFailure extends Failure{
  MealSearchHasNoResultFailure(): super(message: "No Meals Matches This Search!");

}

final class CustomDioFailure extends Failure{

  int? statusCode;
  CustomDioFailure({required super.message, this.statusCode});


}