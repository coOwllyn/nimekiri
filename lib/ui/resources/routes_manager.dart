import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/strings_manager.dart';
import 'package:todo_bloc/ui/views/auth/login/login_page.dart';
import 'package:todo_bloc/ui/views/auth/sign%20up/sign_up_page.dart';
import 'package:todo_bloc/ui/views/auth/splash/splash_page.dart';
import 'package:todo_bloc/ui/views/auth/welcome/welcome_page.dart';
import 'package:todo_bloc/ui/views/calendar/calendar_page.dart';
import 'package:todo_bloc/ui/views/home/home_page.dart';
import 'package:todo_bloc/ui/views/profile/profile_page.dart';
import 'package:todo_bloc/ui/views/todo/new_todo_page.dart';
import 'package:todo_bloc/ui/views/todo/todo_page.dart';

class AppRoutes {
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
      // welcome
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case AppRoutes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomePage());

      // auth
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());

      // home
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      // to do
      case AppRoutes.todoRoute:
        return MaterialPageRoute(builder: (_) => TodoPage());
      case AppRoutes.newTodoRoute:
        return MaterialPageRoute(builder: (_) => NewTodoPage());

      //
      case AppRoutes.calendarRoute:
        return MaterialPageRoute(builder: (_) => CalendarPage());

      //
      case AppRoutes.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: Center(child: const Text(AppStrings.noRouteFound)),
            ));
  }
}
