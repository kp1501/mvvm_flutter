import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/presentation/blocs/todo/todo_bloc.dart';

import 'core/di/injection.dart';
import 'presentation/pages/todo_screen.dart';

void main() {
  init(); // Initialize dependencies
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodoBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
