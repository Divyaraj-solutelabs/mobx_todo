import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/database.bloc.dart';

import 'package:mobx_todo/feature/bloc_todo/blocs/database.state.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/todo.bloc.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/todo.state.dart';
import 'package:mobx_todo/feature/bloc_todo/presentation/hompage.dart';

void main() {
  BlocOverrides.runZoned(
          () => runApp(MultiBlocProvider(providers: [
        BlocProvider<DatabaseBloc>(create: (context) => DatabaseBloc()..initDatabase())
      ], child: const MyApp()))
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Todo Apps'),
    );
  }
}

