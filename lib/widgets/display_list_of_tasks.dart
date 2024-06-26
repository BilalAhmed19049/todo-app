import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/task_details.dart';
import 'package:todo_app/widgets/task_tile.dart';

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
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () {},
                    onTap: () async {
                      await showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return TaskDetails(task: task);
                          });
                    },
                    child: TaskTile(task: task));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
