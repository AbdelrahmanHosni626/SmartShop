import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_cubit.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_states.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  final PageController pageController = PageController();

  BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocConsumer<BottomNavCubit, BottomNavStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BottomNavCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
            ),
          );
        },
      ),
    );
  }
}
