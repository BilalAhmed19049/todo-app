import 'package:equatable/equatable.dart';

import '../../utils/task_categories.dart';
import '../../utils/task_keys.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategories category;
  final bool isCompleted;

  const Task(
      {this.id,
      required this.title,
      required this.note,
      required this.time,
      required this.date,
      required this.category,
      required this.isCompleted});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.category: category.name,
      TaskKeys.time: time,
      TaskKeys.date: date,
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      note: map[TaskKeys.note],
      category: TaskCategories.stringToCategory(map[TaskKeys.category]),
      time: map[TaskKeys.time],
      date: map[TaskKeys.date],
      isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isCompleted,
      category,
    ];
  }

  Task copyWith({
    int? id,
    String? title,
    String? note,
    String? time,
    String? date,
    TaskCategories? category,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
