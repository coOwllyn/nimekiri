import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/resources/values_manager.dart';

class NewTodoBottomSheet extends StatelessWidget {
  const NewTodoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(
          left: AppPadding.p15, right: AppPadding.p15, top: AppPadding.p10),
      height: height * 0.75,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Task',
                style: getHeaderStyle(
                    color: AppColors.black, fontSize: AppSize.s20),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.accentRed,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
