import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/strings_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          AppStrings.weekDay,
          style: getHeaderStyle(fontSize: AppSize.s20, color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          //
        ],
      ),
    );
  }
}
