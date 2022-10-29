import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task_data.dart';
import 'package:todaydo/widgets/task_tile.dart';


class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData , child){
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              longPressCallBack: (){
            taskData.deleteTask(taskData.tasks[index]);
              },
              name: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkBoxCallBack: (checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
            );      },
          itemCount: taskData.tasks.length,
        );
      }
    );
  }
}
