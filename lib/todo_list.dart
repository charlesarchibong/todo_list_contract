import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  final TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var listModel = Provider.of<TodoListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOLIST"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const ListTile(
                title: Text('listModel.todos[index].taskName'),
              ),
              // itemCount: listModel.taskCount,
              // itemBuilder: (context, index) => ListTile(
              //   title: Text(listModel.todos[index].taskName),
              // ),
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
                          // listModel.addTask(t1.text);
                          // t1.clear();
                        },
                        child: const Text("ADD"),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
