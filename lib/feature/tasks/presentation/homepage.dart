import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todo/feature/tasks/model/taskmodel.dart';
import 'package:mobx_todo/feature/tasks/store/tasks.dart';

final tasks= Tasks.getInstance();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tasks.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO APP'
        ),
      ),
        body:
        Observer(

             builder:(context){
                return tasks.TasksList.isEmpty?Center(
                  child: Text(
                    "NO TASKS ARE PRESENT"
                  ),
                ): ListView.builder(
                  itemCount: tasks.TasksList.length,
                    itemBuilder:(context, index){
                      return GestureDetector(
                        onLongPress: (){
                          tasks.deleteNote(
                            tasks.TasksList[index].id
                          );
                        },
                        child:Observer(
                            builder:(context){
                          bool completed= tasks.TasksList[index].compeletd=="0"? false:true;
                          return Card(child:ListTile(
                           leading:Checkbox(
                             value: completed,
                             onChanged: (bool? value){
                               tasks.updateNote(
                                 TaskModel(
                                     id: tasks.TasksList[index].id,
                                     task: tasks.TasksList[index].task,
                                     compeletd: completed==false? "1":"0")
                               );

                             },
                           ),
                           trailing: Text(
                               "${tasks.TasksList[index].id}"
                           ),
                            title: Text(
                              "${tasks.TasksList[index].task}",
                              style: TextStyle(
                                fontSize: 15
                              ),
                            ),

                          ));
                            }
                      ),
                      );
                    }
                );

             }
           ),


    floatingActionButton: FloatingActionButton(
     onPressed: (){
       showDialog(

         context: context,
         builder: (BuildContext context) {
           TextEditingController taskname= TextEditingController() ;
           return Expanded(
             child: AlertDialog(
               title: Text('Add Task'),
               content:Container(

                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black87),
                         borderRadius: BorderRadius.circular(10)
                   ),
                   child: TextField(
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText:'Task Name'
                 ),
               controller: taskname,
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
                       final task=TaskModel(task: taskname.text, compeletd: "0");
                       tasks.addTask(task);
                       Navigator.pop(context);
                     },
                     child: Text("ADD"),
                   ),
                 )
               ],
             ),
           );
         },
       );

     },
    child: Icon(Icons.add),
    )
    );

  }
}
