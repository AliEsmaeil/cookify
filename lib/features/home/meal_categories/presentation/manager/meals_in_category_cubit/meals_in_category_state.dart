part of 'meals_in_category_cubit.dart';

@immutable
sealed class MealsInCategoryStates {}

final class MealsInCategoryInitial extends MealsInCategoryStates {}

final class MealsInCategoryLoadingState extends MealsInCategoryStates{}

final class MealsInCategoryFailureState extends MealsInCategoryStates{
  final Failure failure;

  MealsInCategoryFailureState({required this.failure});
}

final class MealsInCategoryLoadedState extends MealsInCategoryStates{
  final List<MealInCategoryModel> mealInCategory;

  MealsInCategoryLoadedState({required this.mealInCategory});
}


