import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/views/auth/view/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    // Navigator.pushAndRemoveUntil(
    //     context, RoutesContainer.route(), (route) => false);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => WelcomeView()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.nimekiri,
              style: getHeaderStyle(
                color: AppColors.primaryNavy,
                fontSize: FontSize.s25,
              ),
            ),
            const SizedBox(height: 16),
            CircularProgressIndicator(
              color: AppColors.primaryNavy,
            ),
          ],
        ),
      ),
    );
  }
}
