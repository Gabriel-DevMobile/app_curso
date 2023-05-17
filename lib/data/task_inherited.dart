// ignore_for_file: overridden_fields, camel_case_types, annotate_overrides

import 'package:flutter/material.dart';

import '../components/task.dart';

class taskInherited extends InheritedWidget {
  taskInherited({super.key, required this.child}) : super(child: child);

  final List<Task> taskList = [
    const Task('Aprender Flutter', 'assets/images/flutter.png', 4),
    const Task('Andar de Bike', 'assets/images/bicicleta.jpg', 1),
    const Task('Meditar', 'assets/images/meditar.jpg', 5),
    const Task('Ler', 'assets/images/leitura.jpg', 4),
    const Task('Jogar', 'assets/images/logo_lol.jpg', 1),
  ];

  final Widget child;

  void newTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(name, photo, difficulty),
    );
  }

  static taskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<taskInherited>();
  }

  @override
  bool updateShouldNotify(taskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
