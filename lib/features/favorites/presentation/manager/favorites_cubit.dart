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
  final bool _getFavoritesOnStart;
  late final FavoritesUseCase _favoritesUseCase;
  final _localFavoritesManager = LocalFavoritesManager.getInstance();
  static List<MealInCategory> localFavorites = [];

  static FavoritesCubit getCubit({required BuildContext context}) =>
      BlocProvider.of(context);

  FavoritesCubit([this._getFavoritesOnStart = false])
      : super(FavoritesInitial()) {
    _favoritesUseCase = FavoritesUseCase(
        repo: FavoritesRepo(dataSource: FavoritesDataSource()));
    if (_getFavoritesOnStart) {
      getAllFavorites();
    }
  }

  void toggleFavorite({required MealInCategory meal}) {
    if (_localFavoritesManager.favMealIds.contains(meal.id)) {
      removeFavorite(mealId: meal.id ?? '50');
    } else {
      addFavorite(meal: meal);
    }
  }

  void addFavorite({required MealInCategory meal}) async {
    _localFavoritesManager.favMealIds.add(meal.id ?? '50');
    localFavorites.add(meal);

    emit(FavoritesListChangedLocally());
    getAllFavorites();

    var result = await _favoritesUseCase.addFavorite(meal: meal);

    result.fold((failure) => emit(FavoritesFailureState(failure: failure)),
        (isAdded) => emit(FavoritesAddedState(successfulAdd: isAdded)));
  }

  void removeFavorite({required String mealId}) async {
    _localFavoritesManager.favMealIds.remove(mealId);
    localFavorites.removeWhere((meal) => meal.id == mealId);

    emit(FavoritesListChangedLocally());
    getAllFavorites();

    var result = await _favoritesUseCase.removeFavorite(mealId: mealId);

    result.fold(
        (failure) => emit(FavoritesFailureState(failure: failure)),
        (isRemoved) =>
            emit(FavoritesRemovedState(successfulRemove: isRemoved)));
  }

  void getAllFavorites() async {
    emit(FavoritesLoadingState());

    if (localFavorites.isEmpty) {
      var result = await _favoritesUseCase.getAllFavorites();

      result.fold((failure) => emit(FavoritesFailureState(failure: failure)),
          (meals) => localFavorites = meals,
      );
    }
    emit(FavoritesLoadedState(meals: localFavorites));
  }

  bool isInFavorites({required String mealId}) =>
      _localFavoritesManager.favMealIds.contains(mealId);
}
