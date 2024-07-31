import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wagba/core/router/router.dart';
import 'package:wagba/core/theme/theme.dart';
import 'firebase_options.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      builder: (context, child){
        return  MaterialApp(
          themeAnimationDuration: const Duration(seconds: 2),
          themeAnimationCurve: Curves.decelerate,
          title: r'Wagba',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: MyRouter.onGenerateRoute,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
