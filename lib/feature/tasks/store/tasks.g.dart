// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Tasks on _Tasks, Store {
  Computed<ObservableList<TaskModel>>? _$TasksListComputed;

  @override
  ObservableList<TaskModel> get TasksList => (_$TasksListComputed ??=
          Computed<ObservableList<TaskModel>>(() => super.TasksList,
              name: '_Tasks.TasksList'))
      .value;

  late final _$_tasksListAtom =
      Atom(name: '_Tasks._tasksList', context: context);

  @override
  ObservableList<TaskModel> get _tasksList {
    _$_tasksListAtom.reportRead();
    return super._tasksList;
  }

  @override
  set _tasksList(ObservableList<TaskModel> value) {
    _$_tasksListAtom.reportWrite(value, super._tasksList, () {
      super._tasksList = value;
    });
  }

  late final _$_TasksActionController =
      ActionController(name: '_Tasks', context: context);

  @override
  dynamic getTasks() {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.getTasks');
    try {
      return super.getTasks();
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addTask(TaskModel taskModel) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.addTask');
    try {
      return super.addTask(taskModel);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateNote(TaskModel updatedTask) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.updateNote');
    try {
      return super.updateNote(updatedTask);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteNote(int? id) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.deleteNote');
    try {
      return super.deleteNote(id);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
TasksList: ${TasksList}
    ''';
  }
}
