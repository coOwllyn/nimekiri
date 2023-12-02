import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightNavy,
      shadowColor: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.whiteNavy,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Text('Priority',
                      style: getBodyStyle(color: AppColors.black)),
                ),
                // const SizedBox(width: 150),
                Row(
                  children: [
                    Icon(Icons.label_important_outline, color: AppColors.black),
                    const SizedBox(width: 10),
                    Icon(Icons.more_vert_outlined, color: AppColors.black)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text('Project name',
                style: getHeaderStyle(
                    color: AppColors.black, fontSize: FontSize.s18)),
            const SizedBox(height: 10),
            Text('Progress', style: getBodyStyle(color: AppColors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Progress line -------------------',
                    style: getBodyStyle(color: AppColors.black)),
                Text('30%', style: getBodyStyle(color: AppColors.black)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(Icons.chat_outlined, color: AppColors.black),
                    const SizedBox(width: 5),
                    Text('7', style: getBodyStyle(color: AppColors.black)),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Icon(Icons.attach_file_outlined, color: AppColors.black),
                    const SizedBox(width: 5),
                    Text('4', style: getBodyStyle(color: AppColors.black)),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined, color: AppColors.black),
                    const SizedBox(width: 5),
                    Text('6 days', style: getBodyStyle(color: AppColors.black)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
