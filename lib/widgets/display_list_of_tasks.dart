import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';

import '../data/models/task.dart';
import 'common_container.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;

    final emptyTaskMessage = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to do';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(emptyTaskMessage),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: task.category.color.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Icon(
                          task.category.icon,
                          color: task.category.color,
                        ),
                      ),
                    )
                  ],
                );
              }),
    );
  }
}
