import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTap});

  final int selectedIndex;

  final Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: ColorManager.primaryGreen,
        unselectedItemColor: ColorManager.grey,
        backgroundColor: ColorManager.white,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: 'To-Do'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
