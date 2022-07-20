import 'package:mobx/mobx.dart';

import '../database/db.dart';
part 'taskmodel.g.dart';

class TaskModel = _TaskModel with _$TaskModel;

abstract class _TaskModel with Store {

  @observable
  int? id;

  @observable
  late String task;

  @observable
  late String compeletd;


  _TaskModel({
    this.id,required this.task,required this.compeletd,
});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_TASK: task,
      DatabaseProvider.COLUMN_COMPELETED: compeletd,
    };
    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  _TaskModel.fromMap(Map<String, dynamic> map,) {
    id = map[DatabaseProvider.COLUMN_ID] as int;
    task = map[DatabaseProvider.COLUMN_TASK] as String;
    compeletd = map[DatabaseProvider.COLUMN_COMPELETED] as String;

  }

}