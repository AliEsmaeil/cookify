import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/features/home/kitchens/data/data_sources/kitchen_data_source.dart';
import 'package:wagba/features/home/kitchens/data/repositories/kitchen_repo.dart';
import 'package:wagba/features/home/kitchens/domain/entities/kitchen.dart';
import 'package:wagba/features/home/kitchens/domain/use_cases/kitchen_use_cases.dart';
import 'package:wagba/features/home/kitchens/presentation/widgets/meals_in_kitchen_list_View.dart';
import 'package:wagba/features/home/meal_categories/data/models/meal_in_category_model.dart';
import 'package:wagba/features/home/meal_categories/presentation/widgets/loading_category_list.dart';

part 'kitchens_view_state.dart';

class KitchensViewCubit extends Cubit<KitchensViewStates> {

  late final KitchenUseCases _kitchenUseCases ;
  List<Kitchen> kitchens = [];
  int chosenKitchenIndex = 0;
  ValueKey tabBarViewKey = ValueKey(UniqueKey());
  List<Widget> mealsInKitchen = <Widget>[];

  static KitchensViewCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  KitchensViewCubit() : super(KitchensViewInitial()){
    _kitchenUseCases = KitchenUseCases(repo: KitchenRepo(dataSource: KitchenDataSource()));
    getKitchens();
  }

  void getKitchens()async{

    emit(KitchenViewKitchensLoadingState());

    var result = await _kitchenUseCases.getAllKitchens();
    result.fold(
            (failure) => emit(KitchenViewMealsFailureState()),
            (kitchs){
              kitchens = kitchs;
              mealsInKitchen = List.generate(kitchens.length, (index) => const LoadingMealCategoryList());
              emit(KitchenViewGotKitchensState());
            },);

    putMealsForKitchen(index: chosenKitchenIndex);

  }


  void putMealsForKitchen({required int index})async{

    emit(KitchenViewMealsLoadingState());

    chosenKitchenIndex = index;

    if(mealsInKitchen[chosenKitchenIndex] is LoadingMealCategoryList)
      {
        var meals = await getMealsInKitchen(kitchenName: kitchens[chosenKitchenIndex].name);
        mealsInKitchen[chosenKitchenIndex] = MealsInKitchenOrCategoryListView(meals: meals);
        print('updateeeeeeed');
        tabBarViewKey = ValueKey(UniqueKey());
        emit(KitchenViewUpdatedMealsInKitchenState());
      }

  }

  Future<List<MealInCategoryModel>> getMealsInKitchen({required String kitchenName})async{

   var result = await _kitchenUseCases.getMealsInKitchen(kitchenName: kitchenName);

    //  result.fold(
    //         (failure) => emit(MealsInKitchenFailureState(failure: failure)) ,
    //         (meals) => emit(MealsInKitchenLoadedState(meals: meals)),
    // );
   return  result.foldRight(<MealInCategoryModel>[], (r, previous) => r as List<MealInCategoryModel>) ;
  }
}
