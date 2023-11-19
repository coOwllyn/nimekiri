import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/resources/values_manager.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskId,
    required this.taskTitle,
    required this.taskDesc,
    required this.onDismissed,
    required this.onDone,
    required this.isDone,
  });

  final String taskId;
  final String taskTitle;
  final String taskDesc;
  final Function() onDismissed;
  final Function() onDone;
  bool isDone;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey<String>(taskId),
        direction: DismissDirection.endToStart,
        background: Container(
          color: AppColors.accentRed,
          child: Icon(
            Icons.delete_outline,
            color: AppColors.white,
          ),
        ),
        onDismissed: (DismissDirection direction) {
          onDismissed();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.whiteNavy),
          child: Column(
            children: [
              ListTile(
                title: Text(taskTitle,
                    style: getHeaderStyle(
                        color: AppColors.black, fontSize: AppSize.s18)),
                subtitle: Text(taskDesc,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getBodyStyle(
                        color: AppColors.black, fontSize: AppSize.s16)),
                onTap: () {
                  // open detailed page
                },
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalDivider(
                      color: AppColors.black,
                      thickness: 2,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: isDone
                            ? Icon(
                                Icons.check,
                                color: AppColors.primaryNavy,
                                size: 35,
                              )
                            : Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: AppColors.accentRed,
                                size: 35,
                              )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
