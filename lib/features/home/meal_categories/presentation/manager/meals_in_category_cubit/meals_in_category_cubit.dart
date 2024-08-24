import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/meal_categories/data/data_sources/category_data_source.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/data/repositories/category_repo.dart';
import 'package:wagba/features/home/meal_categories/domain/use_cases/category_use_cases.dart';

part 'meals_in_category_state.dart';

class MealsInCategoryCubit extends Cubit<MealsInCategoryStates> {

  final CategoryModel category;
  late MealCategoryUseCase _mealInCategoryUseCase;

  MealsInCategoryCubit({required this.category}) : super(MealsInCategoryInitial()){

    _mealInCategoryUseCase = MealCategoryUseCase(repo: CategoryRepo(dataSource: CategoryDataSource()));
    getMealsInCategory();

  }

  void getMealsInCategory()async{

    emit(MealsInCategoryLoadingState());
    var result = await _mealInCategoryUseCase.getMealsInCategory(categoryName: category.name);

    result.fold(
            (failure) => emit(MealsInCategoryFailureState(failure: failure)),
            (meals) => emit(MealsInCategoryLoadedState(mealInCategory: meals as List<MealInCategoryModel>) ) );
  }

}
