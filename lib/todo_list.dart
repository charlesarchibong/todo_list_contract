import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todo_provider.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  final TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOLIST"),
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: provider.tasks.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(provider.tasks[index].name),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: t1,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            onPressed: () {
                              provider.addTask(t1.text);
                              t1.clear();
                            },
                            child: const Text("ADD"),
                          ),
                        )
                      ],
                    )),
              ],
            ),
    );
  }
}
