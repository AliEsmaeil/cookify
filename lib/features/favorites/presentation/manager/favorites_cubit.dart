import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/favorites/data/data_sources/remote_fav_data_source.dart';
import 'package:wagba/features/favorites/data/repositories/fav_repo.dart';
import 'package:wagba/features/favorites/domain/use_cases/fav_usecase.dart';
import 'package:wagba/features/favorites/utils/local_favs_manager.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  late final FavoritesUseCase favoritesUseCase;
  final localFavoritesManager = LocalFavoritesManager.getInstance();

  static FavoritesCubit getCubit({required BuildContext context})=>BlocProvider.of(context);

  FavoritesCubit() : super(FavoritesInitial()) {
    favoritesUseCase = FavoritesUseCase(
        repo: FavoritesRepo(dataSource: FavoritesDataSource()));
  }

  void toggleFavorite({required MealInCategory meal}) {
    if (localFavoritesManager.favMealIds.contains(meal.id)) {
      removeFavorite(mealId: meal.id ?? '50');
    } else {
      addFavorite(meal: meal);
    }
  }

  void addFavorite({required MealInCategory meal}) async {
    localFavoritesManager.favMealIds.add(meal.id ?? '50');

    emit(FavoritesListChangedLocally());

    var result = await favoritesUseCase.addFavorite(meal: meal);

    result.fold((failure) => emit(FavoritesFailureState(failure: failure)),
        (isAdded) => emit(FavoritesAddedState(successfulAdd: isAdded)));
  }

  void removeFavorite({required String mealId}) async {
    localFavoritesManager.favMealIds.remove(mealId);

    emit(FavoritesListChangedLocally());

    var result = await favoritesUseCase.removeFavorite(mealId: mealId);

    result.fold(
        (failure) => emit(FavoritesFailureState(failure: failure)),
        (isRemoved) =>
            emit(FavoritesRemovedState(successfulRemove: isRemoved)));
  }

  void getAllFavorites() async {
    emit(FavoritesLoadingState());

    var result = await favoritesUseCase.getAllFavorites();

    result.fold((failure) => emit(FavoritesFailureState(failure: failure)),
        (meals) => emit(FavoritesLoadedState(meals: meals)));
  }

  bool isInFavorites({required String mealId})=>localFavoritesManager.favMealIds.contains(mealId);

}
