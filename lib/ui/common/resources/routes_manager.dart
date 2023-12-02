import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/views/auth/view/login_view.dart';
import 'package:todo_bloc/ui/views/auth/view/sign_up_view.dart';
import 'package:todo_bloc/ui/views/auth/view/splash_view.dart';
import 'package:todo_bloc/ui/views/auth/view/welcome_view.dart';
import 'package:todo_bloc/ui/views/calendar/calendar_view.dart';
import 'package:todo_bloc/ui/views/home/home_view.dart';
import 'package:todo_bloc/ui/views/settings/profile_view.dart';
import 'package:todo_bloc/ui/views/settings/settings_view.dart';
import 'package:todo_bloc/ui/views/tasks/new_task_view.dart';
import 'package:todo_bloc/ui/views/tasks/tasks_view.dart';

class AppRoutes {
  static const String rotesContainerRoute = "/rotesContainer";
  // welcome
  static const String splashRoute = "/";
  static const String welcomeRoute = "/welcome";
  // auth
  static const String signUpRoute = "/signUp";
  static const String loginRoute = "/login";
  // home
  static const String homeRoute = "/home";
  static const String notificationsRoute = "/notifications";
  // to do
  static const String todoRoute = "/todo";
  static const String newTodoRoute = "/newTodo";
  // calendar
  static const String calendarRoute = "/calendar";
  // settings
  static const String settingsRoute = "/settings";
  static const String profileRoute = "/profile";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // welcome
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeView());

      // auth
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());

      // home
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());

      // to do
      case AppRoutes.todoRoute:
        return MaterialPageRoute(builder: (_) => const TasksView());
      case AppRoutes.newTodoRoute:
        return MaterialPageRoute(builder: (_) => const NewTaskView());

      // calendar
      case AppRoutes.calendarRoute:
        return MaterialPageRoute(builder: (_) => const CalendarView());

      // settings
      case AppRoutes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsView());
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
