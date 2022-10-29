import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    String? newTextTitle ;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xffFBC02D),
              ),
            ),
             TextField(

              textAlign: TextAlign.center,
              autofocus:
                  true, // this will automatically pop ups keyboard when this opens
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffFBC02D),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffFBC02D),
                  ),
                ),
              ),
              onChanged: (newText){
                newTextTitle = newText;
              //  print(newText);
              },
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 40,
              width: 180,
              child: TextButton(
                onPressed: () {

                   Provider.of<TaskData>(context, listen: false).addTask(newTextTitle!);
                   Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffFBC02D)),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
