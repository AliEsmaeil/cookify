import 'package:flutter/material.dart';
import 'package:wagba/features/auth/login/presentation/pages/auth_screen.dart';
import 'package:wagba/features/auth/signup/presentation/pages/sign_up_screen.dart';
import 'package:wagba/features/home/home_presentation/pages/home_screen.dart';
import 'package:wagba/features/home/meal_categories/data/models/category_model.dart';
import 'package:wagba/features/home/meal_categories/domain/entities/meal_in_category_or_kitchen.dart';
import 'package:wagba/features/home/meal_categories/presentation/pages/meals_in_category_screen.dart';
import 'package:wagba/features/meal_details/pages/meal_details.dart';
import 'package:wagba/features/onBoarding/on_boarding.dart';
import 'package:wagba/features/splash/splash_screen.dart';

final class MyRouter{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case SplashScreen.routeName :
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case OnBoardingScreen.routeName:
        return MaterialPageRoute(builder: (_)=>const OnBoardingScreen());
      case AuthScreen.routeName:
        return MaterialPageRoute(builder: (_)=>const AuthScreen());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_)=>const SignUpScreen());
      case HomeScreen.routeName:
          return MaterialPageRoute(builder: (_)=>  const HomeScreen());
      case MealDetailsScreen.routeName:
        return MaterialPageRoute(builder: (_)=>MealDetailsScreen(meal: settings.arguments as MealInCategory));

      case MealsInCategoryScreen.routeName:
        return MaterialPageRoute(builder: (_)=>MealsInCategoryScreen(category: settings.arguments as CategoryModel));
    /*
        case '/details':
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => DetailsPage(
          item: args['item'],
        ),
      );
     */
        // unknown route
      default: return MaterialPageRoute(builder: (_)=>SplashScreen());

    }
  }

  static void navigateTo(BuildContext context, String routeName)=>Navigator.of(context).pushNamed(routeName);

}

