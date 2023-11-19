import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/routes_manager.dart';
import 'package:todo_bloc/ui/common/resources/theme_manager.dart';
import 'package:todo_bloc/ui/views/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';
import 'package:todo_bloc/ui/views/auth/view/splash_view.dart';
import 'package:todo_bloc/ui/views/auth/view/welcome_view.dart';
import 'package:todo_bloc/ui/views/home/widgets/routes_conatainer.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();

  int appState = 0;

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc()
            ..add(
              const GetInitialUser(),
            ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          final status = state.status;
          debugPrint(status.name);
          if (status == UserStatus.loading) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              theme: FlutterTodosTheme.light,
              darkTheme: FlutterTodosTheme.dark,
              home: const Scaffold(
                backgroundColor: Colors.black,
                body: SplashView(),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: AppRoutes.splashRoute,
            theme: FlutterTodosTheme.light,
            darkTheme: FlutterTodosTheme.dark,
            home: status == UserStatus.loggedIn
                ? RoutesContainer.route()
                : WelcomeView(),
          );
        },
      ),
    );
  }
}
