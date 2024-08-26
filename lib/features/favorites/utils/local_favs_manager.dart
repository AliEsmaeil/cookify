import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/favorites/data/data_sources/remote_fav_data_source.dart';
import 'package:wagba/features/favorites/data/repositories/fav_repo.dart';
import 'package:wagba/features/favorites/domain/use_cases/fav_usecase.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/firebase_options.dart';

class LocalFavoritesManager {
  List<String> favMealIds = <String>[];

  static LocalFavoritesManager? _instance;

  LocalFavoritesManager._internal();

  static LocalFavoritesManager getInstance() {
    return _instance = _instance ?? LocalFavoritesManager._internal();
  }

  Future<void> initializeLocalFavorites() async {
    RootIsolateToken? rootIsolateToken = RootIsolateToken.instance;

    final ReceivePort receivePort = ReceivePort();

    try {
      await Isolate.spawn(
          _favoritesGetterIsolate,
          <dynamic>[receivePort.sendPort, rootIsolateToken],
        errorsAreFatal: true,
        onExit: receivePort.sendPort,
        onError: receivePort.sendPort,
      );
    } on IsolateSpawnException catch (exception) {
      print('isolate exception ${exception}');
    } on Failure catch (failure) {
      print('failure ${failure}');
    } catch (exception) {
      print('unknown exception in isolate ${exception}');
    }

    // deserialize the returned List.

    favMealIds = (await receivePort.first as List<Map<String, dynamic>>)
        .map((jsonMeal) => MealInCategoryModel.fromJson(jsonMeal))
        .map((model) => model.id ?? '50')
        .toList();
  }

  static void _favoritesGetterIsolate(List<dynamic> params) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(params[1]);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FavoritesUseCase favoritesUseCase = FavoritesUseCase(
        repo: FavoritesRepo(dataSource: FavoritesDataSource()));

    var result = await favoritesUseCase.getAllFavorites();

    SendPort sendPort = params[0];

    result.fold(
      (failure) => throw failure,
      (list) {
        // make serialization, because isolates don't support complex object transmission

        List<Map<String, dynamic>> serializedList =
            list.map((meal) => meal.toModel().toJson()).toList();
        // sendPort.send(serializedList);
        Isolate.exit(sendPort, serializedList);
      },
    );
  }
}
