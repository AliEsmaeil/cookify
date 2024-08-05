part of 'meal_category_list_cubit.dart';

@immutable
sealed class MealCategoryListStates extends Equatable{}

final class MealCategoryListInitial extends MealCategoryListStates {
  @override
  List<Object?> get props => [];
}

final class MealCategoryListLoadingState extends MealCategoryListStates{
  @override
  List<Object?> get props => [];
}

final class MealCategoryListLoadedState extends MealCategoryListStates{

  final List<CategoryModel> categoryList;

   MealCategoryListLoadedState({required this.categoryList});

  @override
  List<Object?> get props => [categoryList];

}

final class MealCategoryListFailureState extends MealCategoryListStates{

  final Failure failure;

  MealCategoryListFailureState({required this.failure});

  @override
  List<Object?> get props => [];

}

