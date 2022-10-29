import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final Function(bool?) checkBoxCallBack;
  final Function() longPressCallBack;
    const TaskTile(
      {required this.name,
      required this.isChecked,
      required this.checkBoxCallBack, required this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      trailing: Checkbox(
        //checkColor: const Color(0xffFBC02D),
        activeColor: const Color(0xffFBC02D),
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
      title: Text(
        name,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}

/*

}*/
