import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/app/app_bloc_observer.dart';
import 'package:todo_bloc/data/todo_api.dart';
import 'package:todo_bloc/data/todos_repository.dart';

import 'app.dart';

// void bootstrap({required TodosApi todosApi}) {
//   FlutterError.onError = (details) {
//     log(details.exceptionAsString(), stackTrace: details.stack);
//   };
//
//   Bloc.observer = const AppBlocObserver();
//
//   final todosRepository = TodosRepository(todosApi: todosApi);
//
//   runZonedGuarded(
//     () => runApp(MyApp()),
//     (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
//   );
// }
