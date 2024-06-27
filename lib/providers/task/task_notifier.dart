import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/task/task_state.dart';

import '../../data/models/task.dart';
import '../../data/repositories/task_repositories.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;

  TaskNotifier(this._repository) : super(const TaskState.initial());

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updateTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updateTask);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
