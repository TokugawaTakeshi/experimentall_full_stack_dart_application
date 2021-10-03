import "package:business_rules/Enterprise/Task.dart";
import "package:flutter/material.dart";


class TaskCard extends StatelessWidget {

  final Task task;
  final Function onPressEditTaskButton;
  final Function onPressDeleteTaskButton;

  TaskCard({
    Key? key,
    required this.task,
    required this.onPressEditTaskButton,
    required this.onPressDeleteTaskButton
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (
      DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: onClickCheckBox
              ),
              SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        height: 2.0,
                      )
                    )
                  ]
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onPressEditTaskButton(),
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text("Edit")
                      ]
                    )
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onPressDeleteTaskButton(),
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text("Delete")
                      ]
                    )
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }

  void onClickCheckBox(bool? newValue) {
    print(newValue);
  }
}
