import 'package:flutter/material.dart';
import 'package:todolistflutterapp/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            task.description,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            task.category.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
  }
}
