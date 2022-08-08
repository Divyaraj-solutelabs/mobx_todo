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

_TaskModel.fromMap(Map<String, dynamic> res):
    id=res[DatabaseProvider.COLUMN_ID],
    task=res[DatabaseProvider.COLUMN_TASK],
    compeletd=res[DatabaseProvider.COLUMN_COMPELETED];
 Map<String, Object?> toMap(){
   return {
     DatabaseProvider.COLUMN_ID:id,
    DatabaseProvider.COLUMN_TASK:task,
     DatabaseProvider.COLUMN_COMPELETED:compeletd
   };

 }

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{
  //     DatabaseProvider.COLUMN_TASK: task,
  //     DatabaseProvider.COLUMN_COMPELETED: compeletd,
  //   };
  //   if (DatabaseProvider.COLUMN_ID != null) {
  //     map[DatabaseProvider.COLUMN_ID] = id;
  //   }
  //   return map;
  // }

  // _TaskModel.fromMap(Map<String, dynamic> map,) {
  //   id = map[DatabaseProvider.COLUMN_ID] as int;
  //   task = map[DatabaseProvider.COLUMN_TASK] as String;
  //   compeletd = map[DatabaseProvider.COLUMN_COMPELETED] as String;
  //
  // }

}