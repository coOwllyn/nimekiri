import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/strings_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/models/username.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_button.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: LayoutBuilder(builder: (context, constraint) {
          final Username username = context.watch<AuthBloc>().state.username;
          final String email = context.watch<AuthBloc>().state.email;

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
                              onChanged: (value) {
                                context
                                    .read<AuthBloc>()
                                    .add(UsernameChangedEvent(value));
                                debugPrint(username.value);
                                debugPrint(value);
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
                              onChanged: (value) {
                                context
                                    .read<AuthBloc>()
                                    .add(EmailChangedEvent(value));
                              },
                              hintText: AppStrings.emailHint,
                              isPassword: false,
                              obscureText: false,
                              showClearButton: email.isNotEmpty,
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
                              onChanged: (value) {
                                context
                                    .read<AuthBloc>()
                                    .add(PasswordChangedEvent(value));
                              },
                              hintText: AppStrings.passwordHint,
                              isPassword: true,
                              showClearButton: false,
                              type: InputType.password,
                              obscureText: !state.passwordVisible,
                              onPressedPassword: () {
                                context
                                    .read<AuthBloc>()
                                    .add(PasswordVisibilityChangedEvent());
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
                          onTap: () {},
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
