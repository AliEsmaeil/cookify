part of 'basket_cubit.dart';

@immutable
sealed class BasketStates {}

final class BasketInitial extends BasketStates {}

final class BasketMealsLoadingState extends BasketStates{}

final class BasketMealsLocallyChangedState extends BasketStates{
  final List<MealInCategory> mealsInBasket;

  BasketMealsLocallyChangedState({required this.mealsInBasket});

}

final class BasketMealsGloballyChangedState extends BasketStates{}

final class BasketMealsFailureState extends BasketStates{
  final Failure failure;
  BasketMealsFailureState({required this.failure});
}



