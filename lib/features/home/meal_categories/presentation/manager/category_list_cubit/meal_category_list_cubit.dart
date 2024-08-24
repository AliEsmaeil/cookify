import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/meal_categories/data/data_sources/category_data_source.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/data/repositories/category_repo.dart';
import 'package:wagba/features/home/meal_categories/domain/use_cases/category_use_cases.dart';

part 'meal_category_list_state.dart';

class MealCategoryListCubit extends Cubit<MealCategoryListStates> {

  late final MealCategoryUseCase _mealCategoryUseCase;

  MealCategoryListCubit() : super(MealCategoryListInitial()){
    _mealCategoryUseCase = MealCategoryUseCase(repo: CategoryRepo(dataSource: CategoryDataSource()));
    getMealCategories();
  }

  void getMealCategories()async{

    emit(MealCategoryListLoadingState());

    var result =  await _mealCategoryUseCase.getAllCategories();
    
    result.fold(
            (failure) => emit(MealCategoryListFailureState(failure: failure)),
          (list) => emit(MealCategoryListLoadedState(categoryList: list as List<CategoryModel>)),
    );

  }


}
