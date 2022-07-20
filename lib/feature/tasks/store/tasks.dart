import 'package:mobx/mobx.dart';
import 'package:mobx_todo/feature/tasks/model/taskmodel.dart';

import '../database/db.dart';
part 'tasks.g.dart';

class Tasks extends _Tasks with  _$Tasks{
  Tasks._();
  factory Tasks.getInstance() => _instance;
  static final Tasks _instance = Tasks._();
}

abstract class _Tasks with Store{

  @observable
  ObservableList<TaskModel> _tasksList= ObservableList<TaskModel>();


  @computed
  ObservableList<TaskModel> get TasksList {
    return ObservableList<TaskModel>.of(_tasksList);
  }

  @action
  getTasks() {

    DatabaseProvider.db.getTasks().then((TaskList) {
      runInAction(() {
        _tasksList = ObservableList.of(TaskList);
      });
    });
  }

  @action
  addTask(TaskModel taskModel){
    DatabaseProvider.db.insert(taskModel).then(
          (storedNote) => runInAction(
            () {
          _tasksList.insert(0, storedNote);
        },
      ),
    );
  }

  @action
  updateNote(TaskModel updatedTask) {
    DatabaseProvider.db.update(updatedTask).then((_) => runInAction(() {
      var founditem = _tasksList.firstWhere(
            (element) => element.id == updatedTask.id,
      );
      if (founditem != null) {
        founditem.compeletd = updatedTask.compeletd;
        founditem.task = updatedTask.task;
      }
    }));
  }

  @action
  deleteNote(int? id) {
    DatabaseProvider.db.delete(id).then((_) => runInAction(() {
      _tasksList.removeWhere((element) => element.id == id);
    }));
  }

}