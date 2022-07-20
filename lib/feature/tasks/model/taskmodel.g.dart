// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskModel on _TaskModel, Store {
  late final _$idAtom = Atom(name: '_TaskModel.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$taskAtom = Atom(name: '_TaskModel.task', context: context);

  @override
  String get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(String value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$compeletdAtom =
      Atom(name: '_TaskModel.compeletd', context: context);

  @override
  String get compeletd {
    _$compeletdAtom.reportRead();
    return super.compeletd;
  }

  @override
  set compeletd(String value) {
    _$compeletdAtom.reportWrite(value, super.compeletd, () {
      super.compeletd = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
task: ${task},
compeletd: ${compeletd}
    ''';
  }
}
