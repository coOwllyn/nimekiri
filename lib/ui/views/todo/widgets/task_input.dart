import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class TaskInput extends StatelessWidget {
  const TaskInput({
    super.key,
    required this.inputController,
    required this.hintText,
    required this.showClearButton,
    required this.isTitle,
  });

  final TextEditingController inputController;
  final String hintText;
  final bool showClearButton;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.top,
      textAlign: TextAlign.start,
      controller: inputController,
      autofocus: false,
      cursorColor: AppColors.primaryNavy,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.multiline,
      maxLines: isTitle ? 1 : 5,
      style: getBodyStyle(color: AppColors.black),
      decoration: InputDecoration(
          isCollapsed: true,
          prefixIcon: isTitle
              ? Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.primaryNavy,
                )
              : null,
          suffixIcon: showClearButton
              ? IconButton(
                  splashRadius: 25,
                  splashColor: AppColors.primaryNavy,
                  onPressed: () {
                    inputController.clear();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.accentRed,
                    size: 25,
                  ))
              : null,
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          hintStyle: getBodyStyle(
              color: AppColors.black.withOpacity(0.8), fontSize: 15),
          filled: true,
          fillColor: AppColors.lightNavy.withOpacity(0.5),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.primaryNavy, width: 2))),
    );
  }
}
