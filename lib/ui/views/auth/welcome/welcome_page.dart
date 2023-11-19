import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/image_manager.dart';
import 'package:todo_bloc/ui/resources/routes_manager.dart';
import 'package:todo_bloc/ui/resources/strings_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';
import 'package:todo_bloc/ui/views/auth/widgets/auth_button.dart';
import 'package:todo_bloc/ui/views/home/widgets/routes_conatainer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 0,
        centerTitle: true,
        title: Text(
          AppStrings.nimekiri,
          style: getHeaderStyle(
              color: AppColors.primaryNavy, fontSize: AppSize.s20),
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
                padding: const EdgeInsets.only(
                    left: AppPadding.p10, right: AppPadding.p10),
                height: height * 0.3,
                child: SvgPicture.asset(AppImages.welcome)),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p15, right: AppPadding.p15),
              child: Column(
                children: [
                  Text(
                    AppStrings.welcomeTitle,
                    textAlign: TextAlign.center,
                    style: getHeaderStyle(
                        color: AppColors.black, fontSize: AppSize.s20),
                  ),
                  const SizedBox(height: AppSize.s15),
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
              padding: const EdgeInsets.only(
                  left: AppPadding.p15,
                  right: AppPadding.p15,
                  bottom: AppPadding.p10),
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
                  const SizedBox(height: AppSize.s10),
                  AuthButton(
                    onTap: () {},
                    color: AppColors.primaryNavy.withOpacity(0.8),
                    borderColor: Colors.transparent,
                    overColor: AppColors.white.withOpacity(0.5),
                    label: AppStrings.signUpWithFaceBook,
                    textColor: AppColors.white,
                    asset: AppImages.iconFacebook,
                  ),
                  const SizedBox(height: AppSize.s10),
                  Row(
                    children: [
                      const SizedBox(width: AppSize.s10),
                      Expanded(child: Divider(color: AppColors.grey)),
                      const SizedBox(width: AppSize.s15),
                      Text(
                        'OR',
                        style: getBodyStyle(color: AppColors.grey),
                      ),
                      const SizedBox(width: AppSize.s15),
                      Expanded(child: Divider(color: AppColors.grey)),
                      const SizedBox(width: AppSize.s10),
                    ],
                  ),
                  const SizedBox(height: AppSize.s10),
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
                  const SizedBox(height: AppSize.s10),
                  AuthButton(
                    onTap: () {
                      Navigator.of(context).push<void>(RoutesContainer.route());
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
    );
  }
}
