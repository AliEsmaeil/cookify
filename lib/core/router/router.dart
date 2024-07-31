import 'package:flutter/material.dart';
import 'package:wagba/features/onBoarding/on_boarding.dart';
import 'package:wagba/features/splash/splash_screen.dart';

final class MyRouter{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case SplashScreen.routeName :
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case OnBoardingScreen.routeName:
        return MaterialPageRoute(builder: (_)=>const OnBoardingScreen());

        //some route that has passed an arguments
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

