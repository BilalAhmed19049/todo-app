import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/app_alert.dart';

import '../utils/helpers.dart';
import '../widgets/select_category.dart';
import '../widgets/select_date_time.dart';
import '../widgets/text_field_widget.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add new task')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldWidget(
                title: 'Task Title',
                hintText: 'Task Title',
                controller: _titleController,
              ),
              Gap(16),
              SelectCategory(),
              const Gap(16),
              SelectDateTime(),
              const Gap(16),
              TextFieldWidget(
                title: 'Note',
                hintText: 'Task Note',
                maxlines: 5,
                controller: _noteController,
              ),
              Gap(30),
              ElevatedButton(
                  onPressed: () {
                    //print('On press is working**********');
                    _createTask();
                  },
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
          title: title,
          note: note,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          category: category,
          isCompleted: false);

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlert.displaySnackBar(context, 'Task created successfully');
        context.go(RouteLocation.home);
      });
    } else {
      AppAlert.displaySnackBar(context, 'Task title cannot be empty');
    }
  }
}
