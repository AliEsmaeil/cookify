import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wagba/core/constants/api_constants.dart';
import 'package:wagba/core/enums/meal_search_by.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/failures/server_failure.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/meal_search/data/repositories/meal_search_repo.dart';
import 'package:wagba/features/home/meal_search/domain/entities/meal.dart';
import 'package:wagba/features/home/meal_search/domain/use_cases/meal_search_use_cases.dart';
import 'package:wagba/features/home/meal_search/data/data_sources/meal_search_data_source.dart';
import 'package:wagba/features/meal_details/pages/meal_details.dart';
import 'package:wagba/reusable_widgets/networkImage.dart';

class CustomSearchDelegate extends SearchDelegate {
  final String searchBy;
  MealSearchUseCases searchUsecase = MealSearchUseCases(
      repo: MealSearchRepo(dataSource: MealSearchDataSource()));

  CustomSearchDelegate({required this.searchBy});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context)   {
    return StatefulBuilder(
      builder: (context, setState) {
        if (query.isEmpty) {
          return SizedBox.shrink();
        }

        return FutureBuilder(
          future: searchBy == MealSearchBy.name.name
              ? searchMealsByName(query)
              : searchMealsByIngredient(query), // Perform the search
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data != null) {
              final meals = searchBy == MealSearchBy.name.name
                  ? snapshot.data as List<Meal>
                  : snapshot.data as List<MealInCategory>;

              if (meals is List<Meal>) {
                return ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.grey.shade50,
                    onTap: (){
                      goToMealDetails(
                          meal: MealInCategoryModel(meals[index].name,
                              meals[index].imageUrl, meals[index].id),
                          context: context);
                    },
                    child: ListTile(
                        title: Text(meals[index].name),
                        leading: CustomCachedNetworkImage(
                          imgUrl: meals[index].imageUrl,
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                );
              } else {
                var castedMeals = meals as List<MealInCategory>;
                print('meals are casted');
                return ListView.builder(
                  itemCount: castedMeals.length,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.grey.shade50,
                    onTap: (){
                      goToMealDetails(
                          meal: MealInCategoryModel(castedMeals[index].mealName,
                              castedMeals[index].imageUrl, castedMeals[index].id),
                          context: context);
                    },
                    child: ListTile(
                        title: Text(castedMeals[index].mealName!),
                        leading:  CustomCachedNetworkImage(
                          imgUrl: castedMeals[index].imageUrl,
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                );
              }
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text('No Meals Found!'),
              );
            }
            return Center(child: Text('Error: ${snapshot.stackTrace}'));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        if (query.isEmpty) {
          return SizedBox.shrink();
        }

        return FutureBuilder(
          future: searchBy == MealSearchBy.name.name
              ? searchMealsByName(query)
              : searchMealsByIngredient(query), // Perform the search
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data != null) {
              final meals = searchBy == MealSearchBy.name.name
                  ? snapshot.data as List<Meal>
                  : snapshot.data as List<MealInCategory>;

              if (meals is List<Meal>) {
                return ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (context, index) => InkWell(
                      splashColor: Colors.grey.shade50,
                      onTap: (){
                        goToMealDetails(
                            meal: MealInCategoryModel(meals[index].name,
                                meals[index].imageUrl, meals[index].id),
                            context: context);
                      },
                    child: ListTile(
                      title: Text(meals[index].name),
                      leading: CustomCachedNetworkImage(
                        imgUrl: meals[index].imageUrl,
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                );
              } else {
                var castedMeals = meals as List<MealInCategory>;
                print('meals are casted');
                return ListView.builder(
                  itemCount: castedMeals.length,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.grey.shade50,
                    onTap: (){
                      goToMealDetails(
                          meal: MealInCategoryModel(castedMeals[index].mealName,
                              castedMeals[index].imageUrl, castedMeals[index].id),
                          context: context);
                    },
                    child: ListTile(
                      title: Text(castedMeals[index].mealName!),
                      leading:  CustomCachedNetworkImage(
                        imgUrl: castedMeals[index].imageUrl,
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                );
              }
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text('No Meals Found!'),
              );
            }
            return Center(child: Text('Error: ${snapshot.stackTrace}'));
          },
        );
      },
    );
  }

  // A method to search meals based on the query
  Future<List<Meal>> searchMealsByName(String query) async {
    final result = await searchUsecase.searchMealByName(mealName: query);
    return result.fold((failure) {
      return [];
    }, (meals) {
      return meals;
    });
  }

  Future<List<MealInCategory>> searchMealsByIngredient(String query) async {
    final result =
        await searchUsecase.searchMealContainingIngredient(ingredient: query);
    return result.fold((failure) {
      print('failure occured, empty list');
      return [];
    }, (meals) {
      print(' i got ingred data: $meals');
      return meals;
    });
  }

  void goToMealDetails(
      {required MealInCategory meal, required BuildContext context}) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }
}
