import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/routes_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/widgets/app_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        isHome: false,
        backColor: AppColors.white,
        appBarTitle: AppStrings.settings,
        showBackButton: false,
        isSettings: true,
        showProfile: () {
          Navigator.pushNamed(context, AppRoutes.profileRoute);
        },
        showMoreButton: false,
        onTapMore: () {},
      ),
      body: Column(
        children: [
          //
        ],
      ),
    );
  }
}
