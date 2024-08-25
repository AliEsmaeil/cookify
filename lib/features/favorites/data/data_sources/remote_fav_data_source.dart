import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wagba/core/constants/firebase_constants.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/failures/firestore_failure.dart';
import 'package:wagba/features/favorites/data/data_sources/base_fav_data_source.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

class FavoritesDataSource extends BaseFavoritesDataSource{
  @override
  Future<Either<Failure, bool>> addFavorite({required MealInCategory meal}) async{

   try{
     await db.collection(FireStoreConstants.favorites).withConverter<MealInCategory>(
       fromFirestore: (DocumentSnapshot<Map<String, dynamic>> jsonMeal, SnapshotOptions? options){
         return MealInCategoryModel.fromJson(jsonMeal.data()??meal.toModel().toJson());
       } ,
       toFirestore: (MealInCategory passedMeal, SetOptions? options){
         return meal.toModel().toJson();
       },
     ).doc(meal.id).set(meal);

     return Right(true);
   }
   on FirebaseException catch (failure){
     return Left(FireStoreFailure(message: failure.message?? failure.code));
   }
   catch (e){
     return Left(UnknownFailure(message: e.toString()));
   }

    
  }

  @override
  Future<Either<Failure, List<MealInCategory>>> getAllFavorites() async{

    try{
      QuerySnapshot<Map<String, dynamic>> snapshot =  await db.collection(FireStoreConstants.favorites).get();

      return Right(snapshot.docs.map((doc) => MealInCategoryModel.fromJson(doc.data())).toList());
    }
    on FirebaseException catch (failure){
      return Left(FireStoreFailure(message: failure.message?? failure.code));
    }
    catch (e){
      return Left(UnknownFailure(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure, bool>> removeFavorite({required String mealId}) async{

   try{
     await db.collection(FireStoreConstants.favorites).doc(mealId).delete();
     return Right(true);
   }
   on FirebaseException catch (failure){
     return Left(FireStoreFailure(message: failure.message?? failure.code));
   }
   catch (e){
     return Left(UnknownFailure(message: e.toString()));
   }

  }

}