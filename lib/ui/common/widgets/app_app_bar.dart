import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class AppAppBar extends StatefulWidget implements PreferredSizeWidget {
  AppAppBar({
    super.key,
    required this.backColor,
    required this.appBarTitle,
    required this.isHome,
    required this.isSettings,
    required this.showBackButton,
    required this.showMoreButton,
    required this.showProfile,
    required this.onTapMore,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  final Color backColor;
  final String appBarTitle;
  final bool isHome;
  final bool isSettings;
  final bool showBackButton;
  final bool showMoreButton;
  final Function() showProfile;
  final Function() onTapMore;

  @override
  final Size preferredSize;

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backColor,
      leadingWidth: 70,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: widget.isHome
          ? Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteNavy,
              ),
              child: Icon(
                Icons.person_outline,
                color: AppColors.primaryNavy,
              ),
            )
          : widget.showBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.whiteNavy),
                      shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.primaryNavy,
                  ),
                )
              : const SizedBox(),
      title: Text(
        widget.appBarTitle,
        style: getHeaderStyle(
          fontSize: FontSize.s18,
          color: AppColors.primaryNavy,
        ),
      ),
      centerTitle: widget.isHome ? false : true,
      actions: [
        widget.isHome
            ? IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRoutes.notificationRoute);
                },
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.primaryNavy,
                ),
              )
            : widget.isSettings
                ? InkWell(
                    onTap: () {
                      widget.showProfile();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteNavy,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                  )
                : widget.showMoreButton
                    ? InkWell(
                        onTap: () {
                          widget.onTapMore();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteNavy,
                            ),
                            child: Icon(
                              Icons.more_vert_outlined,
                              color: AppColors.primaryNavy,
                            )),
                      )
                    : SizedBox()
      ],
    );
  }
}
