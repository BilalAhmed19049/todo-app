import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/screens/create_task_screen.dart';
import 'package:todo_app/utils/extension.dart';
import 'package:todo_app/widgets/circle_container.dart';

import '../data/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: style.titleMedium,
          ),
          const Gap(16),
          Visibility(
              visible: !task.isCompleted,
              child: Row(
                children: [
                  Text('Task to be completed on ${task.date}'),
                  Icon(
                    Icons.check_box,
                    color: task.category.color,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CreateTaskScreen(
                                      taskId: task.id,
                                    )));
                      },
                      icon: const Icon(Icons.edit))
                ],
              )),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          Text(task.note.isEmpty
              ? ' There is no additional notes for this task'
              : task.note),
          Gap(16),
          Visibility(
              visible: task.isCompleted,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task completed'),
                  Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
