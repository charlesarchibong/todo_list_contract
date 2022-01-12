import 'package:flutter/material.dart';
import 'package:todolist/model/task_model.dart';
import 'package:todolist/services/service.dart';

class TodoProvider extends ChangeNotifier {
  late Services services;

  TodoProvider() {
    services = Services();
    init();
  }
  List<TaskModel> tasks = [];

  bool isLoading = true;

  void init() async {
    await services.initiateSetup();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String value) async {
    isLoading = true;
    notifyListeners();
    await services.addTask(value);
    isLoading = false;
    notifyListeners();
  }
}
