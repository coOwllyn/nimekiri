import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/routes_manager.dart';
import 'package:todo_bloc/ui/common/widgets/app_app_bar.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        context.select((UserBloc user) => user.state.user?.userName);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        appBarTitle: 'Hello, $userName',
        backColor: AppColors.white,
        isHome: true,
        showBackButton: false,
      ),
      body: Column(
        children: [
          //
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.newTodoRoute);
        },
        backgroundColor: AppColors.primaryNavy,
        elevation: 0,
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
