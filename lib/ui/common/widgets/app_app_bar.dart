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
    required this.showBackButton,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  final Color backColor;
  final String appBarTitle;
  final bool isHome;
  final bool showBackButton;

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
      leadingWidth: 60,
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
                          MaterialStatePropertyAll(AppColors.lightNavy),
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
            : SizedBox()
      ],
    );
  }
}
