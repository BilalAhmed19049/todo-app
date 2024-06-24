import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final String isCompleted;

  const Task(
      this.id, this.title, this.note, this.time, this.date, this.isCompleted);

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isCompleted,
    ];
  }
}
