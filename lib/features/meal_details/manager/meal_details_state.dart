part of 'meal_details_cubit.dart';

@immutable
sealed class MealDetailsStates with EquatableMixin {}

final class MealDetailsInitial extends MealDetailsStates {
  @override
  List<Object?> get props =>[];
}

final class MealDetailsLoadingState extends MealDetailsStates{
  @override
  List<Object?> get props =>[];
}

final class MealDetailsGotMealState extends MealDetailsStates{
  final MealModel meal;
  MealDetailsGotMealState({required this.meal});

  @override
  List<Object?> get props =>[meal];
}

final class MealDetailsFailureState extends MealDetailsStates{

  final Failure failure;
  MealDetailsFailureState({required this.failure});

  @override
  List<Object?> get props =>[failure];
}
