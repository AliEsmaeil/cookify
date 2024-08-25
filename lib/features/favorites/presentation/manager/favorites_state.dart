part of 'favorites_cubit.dart';

sealed class FavoritesStates {}

final class FavoritesInitial extends FavoritesStates {}

// real list of favorite meals states
final class FavoritesLoadingState extends FavoritesStates{}

final class FavoritesLoadedState extends FavoritesStates{
  final List<MealInCategory> meals;

  FavoritesLoadedState({required this.meals});
}


// global change states

final class FavoritesAddedState extends FavoritesStates{
  final bool successfulAdd;

  FavoritesAddedState({required this.successfulAdd});
}

final class FavoritesRemovedState extends FavoritesStates{
  final bool successfulRemove;

  FavoritesRemovedState({required this.successfulRemove});
}


// local favorites list states
final class FavoritesListChangedLocally extends FavoritesStates{}
//

final class FavoritesFailureState extends FavoritesStates{
  Failure failure;

  FavoritesFailureState({required this.failure});
}
