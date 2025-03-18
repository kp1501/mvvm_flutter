import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/todo/todo_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    final router = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        switch (state) {
          case TodoLoading():
            return Center(child: CircularProgressIndicator());

          case TodoLoaded():
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Icon(todo.completed ? Icons.check : Icons.close),
                  onTap: () {
                    router.push('/detail', extra: todo);
                  },
                );
              },
            );

          case TodoError():
            return Center(child: Text(state.message));

          default:
            return Center(child: Text("Press the button to load todos"));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => todoBloc.add(FetchTodosEvent()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
