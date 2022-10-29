import 'package:flutter/material.dart';
import 'package:todaydo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [

  ];


  void addTask (String newTextTitle){
      final task = Task(name: newTextTitle);
      tasks.add(task);
      notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}