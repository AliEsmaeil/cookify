
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/firebase_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/failures/firestore_failure.dart';
import 'package:wagba/features/basket/data/data_sources/base_basket_data_source.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class RemoteBasketDataSource extends BaseBasketDataSource{
  @override
  Future<Either<Failure, bool>> addInBasket({required MealInCategory meal})async{

    try{
      await db.collection(FireStoreConstants.basket).doc(meal.id).set(meal.toModel().toJson());
      return const Right(true);
    }
    on FirebaseException catch (failure){
      return Left(FireStoreFailure(message: failure.message?? failure.code));
    }
    catch (e){
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getAllBasket()async{

    try{
      QuerySnapshot<Map<String, dynamic>> meals = await db.collection(FireStoreConstants.basket).get();

      return Right(meals.docs.map((meal) => MealInCategoryModel.fromJson(meal.data())).toList());
    }
    on FirebaseException catch (failure){
      return Left(FireStoreFailure(message: failure.message?? failure.code));
    }
    catch (e){
      return Left(UnknownFailure(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure, bool>> removeFromBasket({required String mealId})async{
    try{
      await db.collection(FireStoreConstants.basket).doc(mealId).delete();
      return const Right(true);
    }
    on FirebaseException catch (failure){
      return Left(FireStoreFailure(message: failure.message?? failure.code));
    }
    catch (e){
      return Left(UnknownFailure(message: e.toString()));
    }
  }

}