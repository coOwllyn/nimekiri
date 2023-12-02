import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.check_box_outlined, color: AppColors.primaryNavy),
                const SizedBox(width: 10),
                Text('To-Do App Ui',
                    style: getHeaderStyle(
                        color: AppColors.black, fontSize: FontSize.s14)),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined,
                color: AppColors.primaryNavy),
          ],
        ),
      ),
    );
  }
}
