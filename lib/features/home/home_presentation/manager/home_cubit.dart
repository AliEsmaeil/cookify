import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wagba/features/favorites/presentation/pages/favorites_tab.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/basket_tab.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/home_tab.dart';
import 'package:wagba/features/home/home_presentation/pages/tabs/settings_teb.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates>{

  int tabIndex = 0;
  static const List<Widget> tabs =  [HomeTab(), BasketTab(), FavoritesTab(), SettingsTab()];

   HomeCubit() : super(HomeInitial());

   static HomeCubit getCubit(BuildContext context)=>BlocProvider.of(context);

   void changeTab(int index){
     tabIndex = index;
     emit(HomeTabNavigatedState());
   }

   Widget get tab =>tabs[tabIndex];



}
