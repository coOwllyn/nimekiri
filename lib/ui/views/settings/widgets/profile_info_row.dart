import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow(
      {super.key, required this.title, required this.hint, required this.icon});

  final String hint;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: AppColors.primaryNavy,
          size: 25,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hint,
                style: getBodyStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.grey,
                )),
            const SizedBox(height: 5),
            Text(title,
                style: getBodyStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.black,
                )),
          ],
        )
      ],
    );
  }
}
