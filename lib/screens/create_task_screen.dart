import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../widgets/select_date_time.dart';
import '../widgets/text_field_widget.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add new task')),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWidget(
              title: 'Task Title',
              hintText: 'Task Title',
            ),
            const Gap(16),
            SelectDateTime(),
            const Gap(16),
            TextFieldWidget(
              title: 'Note',
              hintText: 'Task Note',
              maxlines: 5,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
