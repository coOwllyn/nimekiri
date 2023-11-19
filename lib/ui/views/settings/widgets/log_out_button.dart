import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/widgets/modal_dialog.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';
import 'package:todo_bloc/ui/views/auth/view/welcome_view.dart';
import 'package:todo_bloc/ui/views/settings/widgets/profile_info_row.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return ModalDialog(
                      isDelete: true,
                      onTap: () {},
                      onTap1: () {
                        context.read<UserBloc>().add(const LogOutUser());
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeView.route()),
                            (route) => false);
                      },
                      label: AppStrings.logOut,
                      description: AppStrings.logOutDesc,
                      labelButton: AppStrings.logOut);
                });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.accentRed),
              minimumSize:
                  const MaterialStatePropertyAll(Size(double.infinity, 50)),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.logout_outlined,
                color: AppColors.white,
                size: 25,
              ),
              const SizedBox(width: 20),
              Text(AppStrings.logOut,
                  style: getBodyStyle(
                    fontSize: FontSize.s16,
                    color: AppColors.white,
                  ))
            ],
          ),
        );
      },
    );
  }
}
