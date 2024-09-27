import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/data/data_sources/remote_basket_data_source.dart';
import 'package:wagba/features/basket/data/repositories/basket_repo.dart';
import 'package:wagba/features/basket/domain/entities/meal_in_basket.dart';
import 'package:wagba/features/basket/domain/use_cases/basket_use_case.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketStates> {

  // manages the meals in the basket locally
  //static final LocalBasketManager localBasketManager = LocalBasketManager.getInstance();
 static List<MealInBasket> mealsInBasket = <MealInBasket>[];

  late final BasketUseCase _basketUseCase;

  BasketCubit() : super(BasketInitial()){
    //initializeLocalBasketManager();
    _basketUseCase = BasketUseCase(repo: BasketRepo(dataSource: RemoteBasketDataSource()));
    getAllMealsInBasket();
  }

  // void initializeLocalBasketManager()async{
  //   try{
  //     if(localBasketManager.mealsInBasket.isEmpty){
  //       await localBasketManager.getAllMealsInBasket();
  //     }
  //   }
  //   on Failure catch (failure){
  //     emit(BasketMealsFailureState(failure : failure));
  //   }
  //   catch(e){
  //     emit(BasketMealsFailureState(failure : UnknownFailure(message: 'Something went wrong while getting your basket!')));
  //   }
  // }

  List<MealInBasket> get getMealsInBasket=>mealsInBasket;

  static BasketCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void toggleMealInBasket({required MealInBasket meal}){
    if(mealsInBasket.contains(meal)){
      removeMealFromBasket(mealId: meal.id ?? '50');
    }
    else{
      addMealToBasket(meal: meal);
    }
  }

  void addMealToBasket({required MealInBasket meal})async{

    mealsInBasket.add(meal);
    emit(BasketMealsLocallyChangedState(mealsInBasket: mealsInBasket));

    var result = await _basketUseCase.addInBasket(meal: meal);
    result.fold(
            (failure) => emit(BasketMealsFailureState(failure: failure)),
            (isAdded) => emit(BasketMealsGloballyChangedState())
       );

  }

  void removeMealFromBasket({required String mealId})async{


    mealsInBasket.removeWhere((meal) => meal.id == mealId);
    emit(BasketMealsLocallyChangedState(mealsInBasket: mealsInBasket));

    var result = await _basketUseCase.removeFromBasket(mealId: mealId);
    result.fold(
            (failure) => emit(BasketMealsFailureState(failure: failure)),
            (isAdded) => emit(BasketMealsGloballyChangedState())
    );
  }

  // this method should be called once at creation of this cubit (and still change locally and globally)
  void getAllMealsInBasket()async{

    print('Before getting basket: ${mealsInBasket}');
    if(mealsInBasket.isEmpty){
      emit(BasketMealsLoadingState());
      try{
          var result = await _basketUseCase.getAllBasket();
          result.fold(
              (failure)=>emit(BasketMealsFailureState(failure: failure)),
              (meals){
                print('Meals from firestore: ${meals}');
                mealsInBasket = meals;
                emit(BasketMealsLocallyChangedState(mealsInBasket: meals));
              }
          );
      }
      on Failure catch (failure){
        emit(BasketMealsFailureState(failure: failure));
      }
      catch(e){
        emit(BasketMealsFailureState(failure: UnknownFailure(message: 'unable to load basket, try later!')));
      }
    }

  }

  bool isInBasket({required MealInBasket meal})=>mealsInBasket.contains(meal);

  int get totalPrice{
    int price = 0;
    for (var meal in mealsInBasket) {
      price+= ((int.parse(meal.id ?? '50') % 100) * meal.numberOfOrderedMeals);
    }
    return price;
  }
}
