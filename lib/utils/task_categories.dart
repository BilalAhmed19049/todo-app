import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month, Colors.purple),
  personal(Icons.person, Colors.brown),
  shopping(Icons.shopping_bag, Colors.red),
  social(Icons.people, Colors.yellow),
  travel(Icons.travel_explore, Colors.orangeAccent),
  work(Icons.work, Colors.blue);

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategories.others;
    }
  }

  final IconData icon;
  final Color color;

  const TaskCategories(this.icon, this.color);
}
