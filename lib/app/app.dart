import 'package:flutter/material.dart';
import 'package:todo_bloc/data/todos_repository.dart';
import 'package:todo_bloc/ui/resources/routes_manager.dart';
import 'package:todo_bloc/ui/resources/theme_manager.dart';
import 'package:todo_bloc/ui/views/auth/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();
  int appState = 0;

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: todosRepository,
//       child: MyApp(),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      home: SplashPage(),
    );
  }
}
