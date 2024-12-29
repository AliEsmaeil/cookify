import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/router/router.dart';
import 'package:wagba/core/theme/theme.dart';
import 'package:wagba/core/utils/bloc_observer.dart';
import 'package:wagba/features/basket/presentation/manager/basket_cubit.dart';
import 'package:wagba/features/favorites/presentation/manager/favorites_cubit.dart';
import 'package:wagba/features/home/home_presentation/manager/home_cubit.dart';
import 'package:wagba/features/onBoarding/on_boarding.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'Coockify',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //await LocalFavoritesManager.getInstance().initializeLocalFavorites();
  //await LocalBasketManager.getInstance().getAllMealsInBasket();


  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            // allow the whole app to listen for fav and basket changes, propagate their states
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) => FavoritesCubit(),
            ),
            BlocProvider(
              create: (context) => BasketCubit(),
            ),

          ],
          child: MaterialApp(
            themeAnimationDuration: const Duration(seconds: 2),
            themeAnimationCurve: Curves.decelerate,
            title: 'Coockify',
            debugShowCheckedModeBanner: false,
            initialRoute: OnBoardingScreen.routeName,
            onGenerateRoute: MyRouter.onGenerateRoute,
            theme: AppTheme.lightTheme,
          ),
        );
      },
    );
  }
}
