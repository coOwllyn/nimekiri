import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/calendar/calendar_view.dart';
import 'package:todo_bloc/ui/views/home/cubit%20bottom%20bar/bottom_bar_cubit.dart';
import 'package:todo_bloc/ui/views/home/home_view.dart';
import 'package:todo_bloc/ui/views/home/widgets/bottom_nav_bar.dart';
import 'package:todo_bloc/ui/views/messages/messages_view.dart';
import 'package:todo_bloc/ui/views/settings/settings_view.dart';
import 'package:todo_bloc/ui/views/todo/todo_view.dart';

class RoutesContainer extends StatefulWidget {
  const RoutesContainer({super.key});

  static Widget route() {
    return BlocProvider(
      create: (context) => BottomBarCubit(),
      child: const RoutesContainer(),
    );
  }

  @override
  State<RoutesContainer> createState() => _RoutesContainerState();
}

class _RoutesContainerState extends State<RoutesContainer> {
  final List routes = [
    const HomeView(),
    const TodoView(),
    const MessagesView(),
    const CalendarView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: BlocConsumer<BottomBarCubit, BottomBarState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BottomBarCubit.get(context);
            return Scaffold(
              backgroundColor: AppColors.white,
              body: routes[cubit.currentIndex],
              bottomNavigationBar: BottomNavBar(
                selectedIndex: cubit.currentIndex,
                onItemTap: (index) => cubit.changeBottomNavBar(index),
              ),
            );
          }),
    );
  }
}
