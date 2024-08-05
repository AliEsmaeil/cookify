part of 'kitchens_view_cubit.dart';

@immutable
sealed class KitchensViewStates {}

final class KitchensViewInitial extends KitchensViewStates {}

final class KitchenViewGotKitchensState extends KitchensViewStates{}
final class KitchensViewKitchensFailureState extends KitchensViewStates{}
final class KitchenViewKitchensLoadingState extends KitchensViewStates{}

final class KitchenViewUpdatedMealsInKitchenState extends KitchensViewStates{}
final class KitchenViewMealsFailureState extends KitchensViewStates{}
final class KitchenViewMealsLoadingState extends KitchensViewStates{}

final class KitchenViewTabNavigatedState extends KitchensViewStates{}
