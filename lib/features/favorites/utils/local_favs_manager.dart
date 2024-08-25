import 'dart:isolate';

import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/favorites/data/data_sources/remote_fav_data_source.dart';
import 'package:wagba/features/favorites/data/repositories/fav_repo.dart';
import 'package:wagba/features/favorites/domain/use_cases/fav_usecase.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class LocalFavoritesManager {

   List<String> favMealIds = <String>[];

   static LocalFavoritesManager? _instance;

   LocalFavoritesManager._internal();

   static LocalFavoritesManager getInstance(){
    return _instance = _instance ?? LocalFavoritesManager._internal();
   }
  void initializeLocalFavorites() async {
    final ReceivePort receivePort = ReceivePort();

    try {
      await Isolate.spawn(favoritesGetterIsolate, receivePort.sendPort);
    } on IsolateSpawnException catch (exception) {
      print('isolate exception');
    } on Failure catch (failure) {
      print('failure');
    } catch (exception) {
      print('unknown exception');
    }

    favMealIds = (await receivePort.first as List<MealInCategory>)
        .map((meal) => meal.id ?? '50')
        .toList();
  }

  static void favoritesGetterIsolate(SendPort sendPort) async {
    FavoritesUseCase favoritesUseCase = FavoritesUseCase(
        repo: FavoritesRepo(dataSource: FavoritesDataSource()));
    var result = await favoritesUseCase.getAllFavorites();

    result.fold(
      (failure) => throw failure,
      (list) => sendPort.send(list),
    );
  }
}
