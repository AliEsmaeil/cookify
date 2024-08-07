part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class HomeTabNavigatedState extends HomeStates {}

