import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTap});

  final int selectedIndex;

  final Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: AppColors.white, splashColor: Colors.transparent),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryNavy,
        unselectedItemColor: AppColors.grey,
        onTap: onItemTap,
        backgroundColor: AppColors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: AppStrings.homeLabel),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: AppStrings.toDoLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: AppStrings.messagesLabel,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: AppStrings.calendarLabel),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: AppStrings.settingsLabel),
        ],
      ),
    );
  }
}
