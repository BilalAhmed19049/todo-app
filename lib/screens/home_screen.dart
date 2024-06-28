import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/providers/date_provider.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/display_list_of_tasks.dart';
import 'package:todo_app/widgets/text_widget.dart';
import '../data/models/task.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final incompleteTasks = _incompletedTasks(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: Column(
                children: [
                  const Gap(40),
                  InkWell(
                    onTap: () => Helpers.selectDate(context, ref),
                    child: TextWidget(
                        size: 14,
                        text: DateFormat.yMMMd().format(selectedDate),
                        fontWeight: FontWeight.normal,
                        color: context.colorScheme.surface),
                  ),
                  const Gap(10),
                  TextWidget(
                      size: 40,
                      text: 'My ToDo List',
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.surface),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DisplayListOfTasks(tasks: incompleteTasks),
                  const Gap(20),
                  TextWidget(
                      size: 20,
                      text: 'Completed ',
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  const Gap(20),
                  DisplayListOfTasks(
                    tasks: completedTasks,
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () {
                        context.push(RouteLocation.createTask);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextWidget(
                            size: 16,
                            text: 'Add new task',
                            fontWeight: FontWeight.normal,
                            color: context.colorScheme.surface),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
        if (task.isCompleted && isTaskDay) {
          filteredTasks.add(task);
        }
      }
    }
    return filteredTasks;
  }

  List<Task> _incompletedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);

      if (!task.isCompleted && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}
