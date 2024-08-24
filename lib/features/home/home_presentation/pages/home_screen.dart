import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/features/home/home_presentation/manager/home_cubit.dart';
import 'package:wagba/features/home/home_presentation/widgets/bottom_nav_bar.dart';


class HomeScreen extends StatelessWidget {

  static const routeName = 'home';

  //final UserCredential? userCredential;

  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {


        },
        builder: (context, state) {
          var cubit = HomeCubit.getCubit(context);
          return Scaffold(
            body: cubit.tab,
            bottomNavigationBar: BottomNavBar(
              chosenIndex: cubit.tabIndex,
              onTap: (index)=>cubit.changeTab(index),
            ),
          );
        },
      ),
    );
  }
}

