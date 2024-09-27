import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/firebase_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/failures/firestore_failure.dart';
import 'package:wagba/features/basket/data/data_sources/base_basket_data_source.dart';
import 'package:wagba/features/basket/data/models/meal_in_basket_model.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';

class RemoteBasketDataSource extends BaseBasketDataSource {
  @override
  Future<Either<Failure, bool>> addInBasket(
      {required MealInBasket meal}) async {
    try {

      await db.collection(auth.currentUser!.uid).doc(FireStoreConstants.basket)
          .collection(FireStoreConstants.mealsInBasket).doc(meal.id)
          .set(meal.convertToModel().toJson());

      return const Right(true);
    }
    on FirebaseException catch (failure) {
      return Left(FireStoreFailure(message: failure.message ?? failure.code));
    }
    catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealInBasket>>> getAllBasket() async {
    try {
      QuerySnapshot<Map<String, dynamic>> meals = await db.collection(auth.currentUser!.uid).doc(FireStoreConstants.basket)
          .collection(FireStoreConstants.mealsInBasket).get();

      if(meals.size == 0)
        {
          return Right(<MealInBasket>[]);
        }
      var result = meals.docs.map((meal) => MealInBasketModel.fromJson(meal.data()))
          .toList();
      print('RESULT FROM MEALS IN BASKET : ${result}');

      return Right(result);
    }
    on FirebaseException catch (failure) {
      return Left(FireStoreFailure(message: failure.message ?? failure.code));
    }
    catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFromBasket(
      {required String mealId}) async {
    try {
      await db.collection(auth.currentUser!.uid).doc(FireStoreConstants.basket)
          .collection(FireStoreConstants.mealsInBasket).doc(mealId)
          .delete();
      return const Right(true);
    }
    on FirebaseException catch (failure) {
      return Left(FireStoreFailure(message: failure.message ?? failure.code));
    }
    catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

}