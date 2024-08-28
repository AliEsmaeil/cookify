import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/data/data_sources/remote_basket_data_source.dart';
import 'package:wagba/features/basket/data/repositories/basket_repo.dart';
import 'package:wagba/features/basket/domain/use_cases/basket_use_case.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/firebase_options.dart';

final class LocalBasketManager {
  // singleton management
  static LocalBasketManager? _instance;
  List<MealInCategory> mealsInBasket = [];

  LocalBasketManager._internal();

  static LocalBasketManager getInstance()=>_instance ??= LocalBasketManager._internal();

  // isolate work begins

  Future<void> getAllMealsInBasket() async {
    RootIsolateToken? rootIsolateToken = RootIsolateToken.instance;

    ReceivePort receivePort = ReceivePort();

    try {
      await Isolate.spawn(
          basketIsolate, [receivePort.sendPort, rootIsolateToken],
          errorsAreFatal: true,
          onError: receivePort.sendPort,
          onExit: receivePort.sendPort);
    } on IsolateSpawnException catch (e) {
      print('isolate exception : $e');
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
    mealsInBasket = (await receivePort.first as List<Map<String, dynamic>>)
        .map((jsonMeal) => MealInCategoryModel.fromJson(jsonMeal))
        .toList();
  }

  // this function which is called inside another isolate (must be a top-level function or static one, never be an instance method)
  static Future<void> basketIsolate(List<dynamic> params) async {
    // initialization part
    // isolates are isolated and don't share memory (they don't aware of other variables in the heap of other isolates)
    // so, firebase initialization is must here, to make isolate make a hand shaking with firebase, if not
    // the isolate will find no firebase app.

    SendPort sendPort = params[0];
    RootIsolateToken rootIsolateToken = params[1];

    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    BasketUseCase basketUseCase =
        BasketUseCase(repo: BasketRepo(dataSource: RemoteBasketDataSource()));
    //

    var result = await basketUseCase.getAllBasket();

    result.fold(
        (failure) => throw failure,
        (meals) => Isolate.exit(
            sendPort, meals.map((meal) => meal.toModel().toJson()).toList()));
  }
}
