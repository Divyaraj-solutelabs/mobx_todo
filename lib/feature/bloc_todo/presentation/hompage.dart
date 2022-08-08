import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/database.bloc.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/database.state.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/todo.bloc.dart';
import 'package:mobx_todo/feature/bloc_todo/blocs/todo.state.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _text = "";
  TodoBloc? _todoBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<DatabaseBloc, DatabaseState>(
        listener: (context, state) {
          if (state is LoadDatabaseState) {
            _todoBloc = TodoBloc(database: context.read<DatabaseBloc>().database!);
          }
        },
        builder: (context, state) {
          if (state is LoadDatabaseState) {
            return BlocProvider<TodoBloc>(
                create: (context) => _todoBloc!..getTodos(),
                child: BlocConsumer<TodoBloc, TodoState>(
                  listener: (context, todoState) {},
                  builder: (context, todoState) {
                    if (todoState is InitTodoState) {
                      final todos = _todoBloc!.todos;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10.0,),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: todos.length,
                                separatorBuilder: (context, index) => const SizedBox(height: 10.0,),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Expanded(child: Text(
                                        todos[index].text,
                                        style: const TextStyle(
                                            fontSize: 24.0,
                                        ),
                                      )),
                                      IconButton(
                                          onPressed: () {
                                            _todoBloc!.removeTodo(todos[index].id);
                                          },
                                          icon: const Icon(Icons.delete)
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    }

                    return Container();
                  },
                )
            );
          }

          return const Center(child: Text('Database not loaded'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(

            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                title:const Text('Add Task'),
                content:Container(

                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _text = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:'Task Name'
                      ),

                    )),

                actions: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green
                    ),
                    child: TextButton(
                      onPressed: (){
                        if (_todoBloc != null) {
                          log(_text);
                          _todoBloc!.addTodos(_text);
                        }
                       Navigator.pop(context);
                      },
                      child: Text("ADD"),
                    ),
                  )
                ],
              );
            },
          );

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}