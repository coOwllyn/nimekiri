import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/image_manager.dart';
import 'package:todo_bloc/ui/common/resources/routes_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_button.dart';
import 'package:todo_bloc/ui/views/home/widgets/routes_conatainer.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  static Widget route() {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const WelcomeView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leadingWidth: 0,
          centerTitle: true,
          title: Text(
            AppStrings.nimekiri,
            style: getHeaderStyle(color: AppColors.primaryNavy, fontSize: 20),
          ),
        ),
        body: SafeArea(
          left: false,
          right: false,
          top: false,
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: SvgPicture.asset(AppImages.welcome)),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Text(
                      AppStrings.welcomeTitle,
                      textAlign: TextAlign.center,
                      style:
                          getHeaderStyle(color: AppColors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      AppStrings.welcomeDescription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: getBodyStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    AuthButton(
                      onTap: () {},
                      color: AppColors.white,
                      borderColor: AppColors.primaryNavy,
                      overColor: AppColors.primaryNavy.withOpacity(0.3),
                      label: AppStrings.signUpWithGoogle,
                      textColor: AppColors.primaryNavy,
                      asset: AppImages.iconGoogle,
                    ),
                    const SizedBox(height: 10),
                    AuthButton(
                      onTap: () {},
                      color: AppColors.primaryNavy.withOpacity(0.8),
                      borderColor: Colors.transparent,
                      overColor: AppColors.white.withOpacity(0.5),
                      label: AppStrings.signUpWithFaceBook,
                      textColor: AppColors.white,
                      asset: AppImages.iconFacebook,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(child: Divider(color: AppColors.grey)),
                        const SizedBox(width: 15),
                        Text(
                          'OR',
                          style: getBodyStyle(color: AppColors.grey),
                        ),
                        const SizedBox(width: 15),
                        Expanded(child: Divider(color: AppColors.grey)),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    AuthButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpRoute);
                      },
                      color: AppColors.primaryNavy,
                      borderColor: AppColors.primaryNavy,
                      overColor: AppColors.white.withOpacity(0.5),
                      label: AppStrings.signUpWithEmail,
                      textColor: AppColors.white,
                      asset: '',
                    ),
                    const SizedBox(height: 10),
                    AuthButton(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => RoutesContainer.route()));
                        Navigator.pushNamed(context, AppRoutes.loginRoute);
                      },
                      color: Colors.transparent,
                      borderColor: AppColors.primaryNavy,
                      overColor: AppColors.primaryNavy.withOpacity(0.3),
                      label: AppStrings.haveAccount,
                      textColor: AppColors.primaryNavy,
                      asset: '',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
