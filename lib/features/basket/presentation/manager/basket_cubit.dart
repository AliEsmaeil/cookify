import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/data/data_sources/remote_basket_data_source.dart';
import 'package:wagba/features/basket/data/repositories/basket_repo.dart';
import 'package:wagba/features/basket/domain/use_cases/basket_use_case.dart';
import 'package:wagba/features/basket/utils/local_basket_manager.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketStates> {

  // manages the meals in the basket locally
  static final LocalBasketManager localBasketManager = LocalBasketManager.getInstance() ;
  late final BasketUseCase _basketUseCase;

  BasketCubit() : super(BasketInitial()){
    initializeLocalBasketManager();
    _basketUseCase = BasketUseCase(repo: BasketRepo(dataSource: RemoteBasketDataSource()));
    print('do you see the basket : ${localBasketManager.mealsInBasket}');
  }

  void initializeLocalBasketManager()async{
    if(localBasketManager.mealsInBasket.isEmpty){
     await localBasketManager.getAllMealsInBasket();
    }
  }

  static BasketCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void toggleMealInBasket({required MealInCategory meal}){
    if(localBasketManager.mealsInBasket.contains(meal)){
      removeMealFromBasket(mealId: meal.id ?? '50');
    }
    else{
      addMealToBasket(meal: meal);
    }
  }

  void addMealToBasket({required MealInCategory meal})async{

    localBasketManager.mealsInBasket.add(meal);
    emit(BasketMealsLocallyChangedState(mealsInBasket: localBasketManager.mealsInBasket));

    var result = await _basketUseCase.addInBasket(meal: meal);
    result.fold(
            (failure) => emit(BasketMealsFailureState(failure: failure)),
            (isAdded) => emit(BasketMealsGloballyChangedState())
       );

  }

  void removeMealFromBasket({required String mealId})async{


    localBasketManager.mealsInBasket.removeWhere((meal) => meal.id == mealId);
    emit(BasketMealsLocallyChangedState(mealsInBasket: localBasketManager.mealsInBasket));

    var result = await _basketUseCase.removeFromBasket(mealId: mealId);
    result.fold(
            (failure) => emit(BasketMealsFailureState(failure: failure)),
            (isAdded) => emit(BasketMealsGloballyChangedState())
    );
  }

  // this method should be called once at creation of this cubit (and still change locally and globally)
  void getAllMealsInBasket()async{
print('Before getting basket: ${localBasketManager.mealsInBasket}');
    if(localBasketManager.mealsInBasket.isEmpty){
      emit(BasketMealsLoadingState());
      try{
          await localBasketManager.getAllMealsInBasket();
      }
      on Failure catch (failure){
        emit(BasketMealsFailureState(failure: failure));
      }
      catch(e){
        emit(BasketMealsFailureState(failure: UnknownFailure(message: 'unable to load basket, try later!')));
      }
    }
    print('GOT MEALS IN BASKET : ${localBasketManager.mealsInBasket}');
    emit(BasketMealsLocallyChangedState(mealsInBasket: localBasketManager.mealsInBasket));
  }

  bool isInBasket({required MealInCategory meal})=>localBasketManager.mealsInBasket.contains(meal);
}
