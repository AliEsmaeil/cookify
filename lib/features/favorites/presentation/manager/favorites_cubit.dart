import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/basket/presentation/widgets/meal_in_bsket_builder.dart';
import 'package:wagba/features/favorites/data/data_sources/remote_fav_data_source.dart';
import 'package:wagba/features/favorites/data/repositories/fav_repo.dart';
import 'package:wagba/features/favorites/domain/use_cases/fav_usecase.dart';
import 'package:wagba/features/favorites/utils/local_favs_manager.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {

  late final FavoritesUseCase _favoritesUseCase;

  static List<MealInCategory> localFavorites = [];

  static FavoritesCubit getCubit({required BuildContext context}) => BlocProvider.of(context);

  FavoritesCubit()
      : super(FavoritesInitial()) {
    _favoritesUseCase = FavoritesUseCase(
        repo: FavoritesRepo(dataSource: FavoritesDataSource()));
      getAllFavorites();

  }

  void toggleFavorite({required MealInCategory meal}) {

    print('HEYYYYYYYYYYYYYYY: fav contains this ${meal.id} is :${localFavorites.contains(meal)}');
    print(localFavorites);
    if (localFavorites.contains(meal)) {
      removeFavorite(mealId: meal.id ?? '50');
    } else {
      addFavorite(meal: meal);
    }
  }

  void addFavorite({required MealInCategory meal}) async {
    //_localFavoritesManager.favMealIds.add(meal.id ?? '50');
    localFavorites.add(meal);

    emit(FavoritesListChangedLocally());

    var result = await _favoritesUseCase.addFavorite(meal: meal);

    result.fold((failure) => emit(FavoritesFailureState(failure: failure)),
        (isAdded) => emit(FavoritesAddedState(successfulAdd: isAdded)));
  }

  void removeFavorite({required String mealId}) async {
    //_localFavoritesManager.favMealIds.remove(mealId);
    localFavorites.removeWhere((meal) => meal.id == mealId);

    emit(FavoritesListChangedLocally());

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

  bool isInFavorites({required MealInCategory meal}) =>
      localFavorites.contains(meal);

  static FutureOr<Iterable<Widget>> favoritesSuggestionBuilder(BuildContext context, SearchController controller){
    String searchText = controller.text.toLowerCase();
    List<Widget> matchSearch = [];
    for(var meal in localFavorites){
      if(meal.mealName!.toLowerCase().contains(searchText)){
        matchSearch.add(ListTile(leading: CustomCachedNetworkImage(fit: BoxFit.cover, imgUrl: meal.imageUrl,), title: Text(meal.mealName!),));
      }
    }
    return matchSearch;
  }
}
