import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wagba/features/home/meal_categories/data/data_sources/category_data_source.dart';
import 'package:wagba/features/home/kitchens/data/data_sources/kitchen_data_source.dart';
import 'package:wagba/features/home/meal_search/data/data_sources/meal_search_data_source.dart';
import 'package:wagba/features/home/meal_categories/data/repositories/category_repo.dart';
import 'package:wagba/features/home/kitchens/data/repositories/kitchen_repo.dart';
import 'package:wagba/features/home/meal_search/data/repositories/meal_search_repo.dart';
import 'package:wagba/features/home/meal_categories/domain/use_cases/category_use_cases.dart';
import 'package:wagba/features/home/kitchens/domain/use_cases/kitchen_use_cases.dart';
import 'package:wagba/features/home/meal_search/domain/use_cases/meal_search_use_cases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates>{

  late final MealSearchUseCases _mealSearchUseCases;
  late final KitchenUseCases _mealKitchenUseCases;
  late final MealCategoryUseCase _mealCategoryUseCase;


   HomeCubit() : super(HomeInitial()){
    _mealSearchUseCases = MealSearchUseCases(repo: MealSearchRepo(dataSource: MealSearchDataSource()));
    _mealKitchenUseCases = KitchenUseCases(repo: KitchenRepo(dataSource: KitchenDataSource()));
    _mealCategoryUseCase = MealCategoryUseCase(repo: CategoryRepo(dataSource: CategoryDataSource()));
  }



}
