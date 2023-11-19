import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/resources/values_manager.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/models/email.dart';
import 'package:todo_bloc/ui/views/auth/models/username.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_button.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_input.dart';
import 'package:todo_bloc/ui/views/home/widgets/routes_conatainer.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          context.read<UserBloc>().add(LoadUser(state.receivedUser!));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RoutesContainer.route()),
              (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashRadius: 25,
              padding: EdgeInsets.zero,
              splashColor: AppColors.primaryNavy.withOpacity(0.5),
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.primaryNavy,
              )),
        ),
        body: LayoutBuilder(builder: (context, constraint) {
          final Username username = context.watch<AuthBloc>().state.username;
          final Email email = context.watch<AuthBloc>().state.email;
          final String password =
              context.watch<AuthBloc>().state.password.toString();

          final AuthState state = context.select((AuthBloc bloc) => bloc.state);
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: Text(
                            AppStrings.createAccount,
                            style: getHeaderStyle(
                                color: AppColors.primaryNavy,
                                fontSize: AppSize.s30),
                          ),
                        ),
                        const SizedBox(height: AppSize.s20),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: Text(
                            AppStrings.userName,
                            style: getHeaderStyle(
                                fontSize: AppSize.s15, color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: AppSize.s10),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: AuthInput(
                              onChanged: (usernameValue) {
                                context
                                    .read<AuthBloc>()
                                    .add(UsernameChangedEvent(usernameValue));
                                debugPrint('username ====  ${username.value}');
                                debugPrint(
                                    'value username ==== ${usernameValue}');
                              },
                              hintText: AppStrings.userNameHint,
                              isPassword: false,
                              obscureText: false,
                              showClearButton: username.value.isNotEmpty,
                              type: InputType.text,
                              onPressedPassword: () {},
                              onPressedClear: () {
                                //
                              }),
                        ),
                        const SizedBox(height: AppSize.s20),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: Text(
                            AppStrings.email,
                            style: getHeaderStyle(
                                fontSize: AppSize.s15, color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: AppSize.s10),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: AuthInput(
                              onChanged: (emailValue) {
                                context
                                    .read<AuthBloc>()
                                    .add(EmailChangedEvent(emailValue));
                              },
                              hintText: AppStrings.emailHint,
                              isPassword: false,
                              obscureText: false,
                              showClearButton: false,
                              type: InputType.text,
                              onPressedPassword: () {},
                              onPressedClear: () {
                                //
                              }),
                        ),
                        const SizedBox(height: AppSize.s20),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: Text(
                            AppStrings.password,
                            style: getHeaderStyle(
                                fontSize: AppSize.s15, color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: AppSize.s10),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: AuthInput(
                              onChanged: (passwordValue) {
                                context
                                    .read<AuthBloc>()
                                    .add(PasswordChangedEvent(passwordValue));
                              },
                              hintText: AppStrings.passwordHint,
                              isPassword: true,
                              showClearButton: false,
                              type: InputType.password,
                              obscureText: !state.passwordVisible,
                              onPressedPassword: () {
                                context.read<AuthBloc>().add(
                                    const PasswordVisibilityChangedEvent());
                              },
                              onPressedClear: () {
                                //
                              }),
                        )
                      ],
                    ),
                    const SizedBox(height: AppSize.s20),
                    SafeArea(
                      left: false,
                      right: false,
                      top: false,
                      bottom: true,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p20,
                            right: AppPadding.p20,
                            bottom: AppPadding.p10),
                        child: AuthButton(
                          onTap: () {
                            debugPrint('sign up not success');
                            context
                                .read<AuthBloc>()
                                .add(const SignUpSubmittedEvent());
                            debugPrint('sign up success');
                          },
                          color: AppColors.primaryNavy,
                          borderColor: AppColors.primaryNavy,
                          overColor: AppColors.white.withOpacity(0.5),
                          label: AppStrings.signUp,
                          textColor: AppColors.white,
                          asset: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
