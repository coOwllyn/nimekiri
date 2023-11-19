import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/views/auth/view/login_view.dart';
import 'package:todo_bloc/ui/views/auth/view/sign_up_view.dart';
import 'package:todo_bloc/ui/views/auth/view/splash_view.dart';
import 'package:todo_bloc/ui/views/auth/view/welcome_view.dart';
import 'package:todo_bloc/ui/views/calendar/calendar_view.dart';
import 'package:todo_bloc/ui/views/home/home_view.dart';
import 'package:todo_bloc/ui/views/profile/profile_view.dart';
import 'package:todo_bloc/ui/views/todo/new_todo_view.dart';
import 'package:todo_bloc/ui/views/todo/todo_view.dart';

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
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoutes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeView());

      // auth
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());

      // home
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      // to do
      case AppRoutes.todoRoute:
        return MaterialPageRoute(builder: (_) => TodoView());
      case AppRoutes.newTodoRoute:
        return MaterialPageRoute(builder: (_) => NewTodoView());

      //
      case AppRoutes.calendarRoute:
        return MaterialPageRoute(builder: (_) => CalendarView());

      //
      case AppRoutes.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfileView());

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
