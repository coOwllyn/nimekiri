import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/views/calendar/calendar_page.dart';
import 'package:todo_bloc/ui/views/home/cubit%20bottom%20bar/bottom_bar_cubit.dart';
import 'package:todo_bloc/ui/views/home/home_page.dart';
import 'package:todo_bloc/ui/views/home/widgets/bottom_nav_bar.dart';
import 'package:todo_bloc/ui/views/profile/profile_page.dart';
import 'package:todo_bloc/ui/views/todo/todo_page.dart';

class RoutesContainer extends StatefulWidget {
  const RoutesContainer({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
              create: (context) => BottomBarCubit(),
              child: const RoutesContainer(),
            ));
  }

  @override
  State<RoutesContainer> createState() => _RoutesContainerState();
}

class _RoutesContainerState extends State<RoutesContainer> {
  final List routes = [
    const HomePage(),
    const TodoPage(),
    const CalendarPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarCubit, BottomBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BottomBarCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            body: routes[cubit.currentIndex],
            bottomNavigationBar: BottomNavBar(
              selectedIndex: cubit.currentIndex,
              onItemTap: (index) => cubit.changeBottomNavBar(index),
            ),
          );
        });
  }
}
