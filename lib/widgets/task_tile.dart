import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/utils.dart';

import '../data/models/task.dart';
import 'circle_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});

  final Function(bool?)? onCompleted;
  final Task task;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundopacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundopacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: style.titleMedium?.copyWith(
                  decoration: textDecoration,
                  fontSize: 20,
                  fontWeight: fontWeight,
                ),
              ),
              Text(task.time),
            ],
          ),
          const Spacer(),
          Checkbox(value: task.isCompleted, onChanged: onCompleted)
        ],
      ),
    );
    ;
  }
}
