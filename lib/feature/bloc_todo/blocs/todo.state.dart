import 'package:equatable/equatable.dart';
import 'package:mobx_todo/feature/bloc_todo/models/todo.model.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class InitTodoState extends TodoState {
  final int counter;

  const InitTodoState(this.counter);

  @override
  List<Object> get props => [counter];
}
class AddTodoState extends TodoState {}
class RemoveTodoState extends TodoState {}