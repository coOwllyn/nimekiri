import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/widgets/app_app_bar.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/models/email.dart';
import 'package:todo_bloc/ui/views/auth/models/username.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_button.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_input.dart';
import 'package:todo_bloc/ui/views/home/widgets/routes_conatainer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static Widget route() {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          context.read<UserBloc>().add(LoadUser(state.receivedUser!));
          Navigator.pushAndRemoveUntil(
              // context, RoutesContainer.route(), (route) => false);
              context,
              MaterialPageRoute(builder: (context) => RoutesContainer.route()),
              (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppAppBar(
          appBarTitle: '',
          backColor: AppColors.white,
          isHome: false,
          showBackButton: true,
          isSettings: false,
          showProfile: () {},
          showMoreButton: false,
          onTapMore: () {},
        ),
        body: LayoutBuilder(builder: (context, constraint) {
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
                              left: 20, right: 20, top: 20),
                          child: Text(
                            AppStrings.logInTitle,
                            style: getHeaderStyle(
                                color: AppColors.primaryNavy, fontSize: 30),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            AppStrings.email,
                            style: getHeaderStyle(
                                fontSize: 15, color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            AppStrings.password,
                            style: getHeaderStyle(
                                fontSize: 15, color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                    const SizedBox(height: 20),
                    SafeArea(
                      left: false,
                      right: false,
                      top: false,
                      bottom: true,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: AuthButton(
                          onTap: () {
                            debugPrint('login not success');
                            context
                                .read<AuthBloc>()
                                .add(const LoginSubmittedEvent());
                            debugPrint('login success');
                          },
                          color: AppColors.primaryNavy,
                          borderColor: AppColors.primaryNavy,
                          overColor: AppColors.white.withOpacity(0.5),
                          label: AppStrings.logIn,
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
