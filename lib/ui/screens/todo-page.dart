import 'package:bit_initial/data/state/todo-state.dart';
import 'package:bit_initial/ui/widgets/loader.dart';
import 'package:bit_initial/utils/data/date-helper.dart';
import 'package:bit_initial/utils/injector.dart';
import 'package:bit_initial/utils/ui/basic-widgets.dart';
import 'package:flutter/material.dart';

final todoProvider = getIt.get<TodoStateProvider>();

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      todoProvider.getTodos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The TODO LIST"),
      ),
      body: StreamBuilder<TodoState>(
        stream: todoProvider.todoStream,
        builder: (BuildContext context, AsyncSnapshot<TodoState> snapshot) {
          if (todoProvider.todos.loading) {
            return Center(
              child: Loader(),
            );
          } else {
            return todoProvider.todos.data!
                .fold((l) => emptyList(icon: Icons.error, msg: l.name), (r) {
              return RefreshIndicator(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var item = r[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(beautifiedDate(item.due_date)),
                        trailing: Text(item.task_type.name),
                      );
                    },
                    itemCount: r.length,
                  ),
                  onRefresh: () async =>
                      await todoProvider.getTodos(reload: true));
            });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoProvider.getTodos();
          // TODO: create a task form and update todo list
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
