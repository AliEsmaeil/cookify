import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/home/meal_search/data/data_sources/meal_search_data_source.dart';
import 'package:wagba/features/home/meal_search/data/models/meal_model.dart';
import 'package:wagba/features/home/meal_search/data/repositories/meal_search_repo.dart';
import 'package:wagba/features/home/meal_search/domain/use_cases/meal_search_use_cases.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsStates> {
  final String mealId;
  late final MealSearchUseCases _mealSearchUseCases;

  MealDetailsCubit({required this.mealId}) : super(MealDetailsInitial()){
    _mealSearchUseCases = MealSearchUseCases(repo: MealSearchRepo(dataSource: MealSearchDataSource()));
    getMeal();
  }
  
  void getMeal()async{
    
    emit(MealDetailsLoadingState());
    
    var result = await _mealSearchUseCases.searchMealById(mealId: mealId);
    
    result.fold(
            (failure) => emit(MealDetailsFailureState(failure: failure)),
            (meal) => emit(MealDetailsGotMealState(meal: meal as MealModel))
       );
  }
  
  
}
