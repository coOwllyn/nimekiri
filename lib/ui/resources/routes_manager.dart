import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/strings_manager.dart';
import 'package:todo_bloc/ui/views/auth/sign%20up/sign_up_page.dart';
import 'package:todo_bloc/ui/views/auth/splash/splash_page.dart';
import 'package:todo_bloc/ui/views/auth/welcome/welcome_page.dart';
import 'package:todo_bloc/ui/views/calendar/calendar_page.dart';
import 'package:todo_bloc/ui/views/home/home_page.dart';
import 'package:todo_bloc/ui/views/new%20todo/new_todo_page.dart';
import 'package:todo_bloc/ui/views/profile/profile_page.dart';
import 'package:todo_bloc/ui/views/todo/todo_page.dart';

class Routes {
  static const String splashRoute = "/";
  static const String rotesContainerRoute = "/rotesContainer";
  static const String welcomeRoute = "/welcome";
  static const String signUpRoute = "/signUp";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String registerRoute = "/register";
  static const String todoRoute = "/todo";
  static const String newTodoRoute = "/newTodo";
  static const String profileRoute = "/profile";
  static const String calendarRoute = "/calendar";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case Routes.loginRoute:
      //   initLoginModule();
      //   return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.registerRoute:
      //   initRegisterModule();
      //   return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.todoRoute:
        return MaterialPageRoute(builder: (_) => TodoPage());
      case Routes.newTodoRoute:
        return MaterialPageRoute(builder: (_) => NewTodoPage());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case Routes.calendarRoute:
        return MaterialPageRoute(builder: (_) => CalendarPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
