import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/widgets/app_app_bar.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';
import 'package:todo_bloc/ui/views/settings/widgets/log_out_button.dart';
import 'package:todo_bloc/ui/views/settings/widgets/profile_info_row.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        context.select((UserBloc user) => user.state.user?.userName);
    final email = context.select((UserBloc user) => user.state.user?.email);

    return Scaffold(
        backgroundColor: AppColors.whiteNavy,
        appBar: AppAppBar(
            backColor: AppColors.whiteNavy,
            appBarTitle: '',
            isHome: false,
            isSettings: false,
            showBackButton: true,
            showProfile: () {}),
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(height: 40, color: AppColors.whiteNavy),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                    ),
                  ],
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            border: Border.all(color: AppColors.primaryNavy)),
                        child: Icon(
                          Icons.person_outline,
                          size: 50,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 0,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: AppColors.primaryNavy,
                          child: IconButton(
                              onPressed: () {},
                              splashRadius: 2,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(
                                Icons.photo_camera_rounded,
                                size: 14,
                                color: AppColors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: AppColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          ProfileInfoRow(
                            title: '$userName',
                            hint: AppStrings.userName,
                            icon: Icons.person_pin_outlined,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(
                              color: AppColors.grey.withOpacity(0.5),
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProfileInfoRow(
                            title: '$email',
                            hint: AppStrings.email,
                            icon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(
                              color: AppColors.grey.withOpacity(0.5),
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProfileInfoRow(
                            title: 'Job title',
                            hint: AppStrings.jobTitle,
                            icon: Icons.work_outline,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(
                              color: AppColors.grey.withOpacity(0.5),
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProfileInfoRow(
                            title: 'Location',
                            hint: AppStrings.location,
                            icon: Icons.location_on_outlined,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(
                              color: AppColors.grey.withOpacity(0.5),
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, bottom: 30, right: 30),
                      child: BlocProvider(
                        create: (context) => AuthBloc(),
                        child: LogOutButton(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
