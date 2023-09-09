import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/font_manager.dart';
import 'package:todo_bloc/ui/resources/routes_manager.dart';
import 'package:todo_bloc/ui/resources/strings_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/views/auth/welcome/welcome_page.dart';
import 'package:todo_bloc/ui/views/home/widgets/routes_conatainer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    // Navigator.pushAndRemoveUntil(
    //     context, RoutesContainer.route(), (route) => false);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => WelcomePage()), (route) => false);
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
