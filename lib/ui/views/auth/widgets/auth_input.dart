import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';

enum InputType { text, password }

class AuthInput extends StatefulWidget {
  const AuthInput({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.isPassword,
    required this.obscureText,
    required this.showClearButton,
    required this.onPressedClear,
    required this.onPressedPassword,
    required this.type,
  });

  final Function(dynamic value) onChanged;
  final String hintText;
  final bool isPassword;
  final bool obscureText;
  final bool showClearButton;
  final InputType type;
  final Function() onPressedClear;
  final Function() onPressedPassword;

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    inputController.addListener(() {
      debugPrint('error');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      onChanged: (value) {
        widget.onChanged(value);
      },
      autofocus: false,
      cursorColor: AppColors.primaryNavy,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      style: getBodyStyle(color: AppColors.black),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    widget.onPressedPassword();
                  },
                  icon: Icon(
                    widget.type == InputType.password
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.white,
                  ))
              : widget.showClearButton
                  ? IconButton(
                      onPressed: () {
                        inputController.clear();
                        widget.onPressedClear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.accentRed,
                        size: AppSize.s25,
                      ))
                  : null,
          contentPadding: const EdgeInsets.all(AppSize.s20),
          hintText: widget.hintText,
          hintStyle:
              getBodyStyle(color: AppColors.white, fontSize: AppSize.s15),
          filled: true,
          fillColor: AppColors.lightNavy,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
              borderSide: BorderSide(color: AppColors.primaryNavy, width: 2))),
    );
  }
}
