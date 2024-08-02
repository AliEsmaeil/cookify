import 'package:wagba/core/config/config.dart';

final class ApiConstants{

  static final baseUrl = 'https://www.themealdb.com/api/json/v1/${Config.apiKey}/';

  // end points,
  static const kitchenEndPoint ='list.php?';  // qp : a=list

  // endpoint for
  // meals in category, qp: c=Seafood
  // meals in kitchen qp : a=Canadian
  // and search meal by ingredient; qp : i=lemon

  static const mealsInCategoryEndpoint = 'filter.php?';

  // no qp
  static const categoriesEndPoint = 'categories.php?';

  // search endpoints
  //qp : s=A
  static const searchByNameEndPoint = 'search.php?';
  //qp : i=52772
  static const searchById = 'lookup.php?';
  // no qp
  static const randomMeal = 'random.php';

}