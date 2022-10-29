import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task_data.dart';
import 'package:todaydo/screens/add_task_screen.dart';

import '../size_config.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFBC02D),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddTaskScreen(),
                ),
              ),
            );
          },
          backgroundColor: const Color(0xffFBC02D),
          child: const Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:  EdgeInsets.all(SizeConfig.blockSizeVertical * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CircleAvatar(
                    radius: SizeConfig.blockSizeVertical * 4,
                    backgroundColor: Colors.white,
                    child:  Icon(
                      Icons.list,
                      size: SizeConfig.blockSizeVertical * 5,
                      color: Colors.green,
                    ),
                  ),
                   SizedBox(
                    height: SizeConfig.blockSizeVertical * 2 ,
                  ),
                   Text(
                    'ToDayDo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 11,
                        fontWeight: FontWeight.w700),
                  ),
                   SizedBox(
                    height: SizeConfig.blockSizeVertical * 1 ,
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).tasks.length} Tasks',
                    style:  TextStyle(color: Colors.white, fontSize: SizeConfig.blockSizeHorizontal * 4),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 7 ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const TaskList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
