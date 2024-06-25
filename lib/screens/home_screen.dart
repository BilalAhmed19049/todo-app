import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/models/models.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/display_list_of_tasks.dart';
import 'package:todo_app/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                  TextWidget(
                      size: 14,
                      text: 'Aug 7, 2023',
                      fontWeight: FontWeight.normal,
                      color: context.colorScheme.surface),
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
                  const DisplayListOfTasks(tasks: [
                    Task(
                        title: 'title',
                        note: 'note',
                        time: '10:20',
                        date: 'Aug, 07, 2024',
                        isCompleted: false,
                        category: TaskCategories.shopping)
                  ]),
                  const Gap(20),
                  TextWidget(
                      size: 20,
                      text: 'Completed ',
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  const Gap(20),
                  const DisplayListOfTasks(
                    tasks: [],
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () {},
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
}
