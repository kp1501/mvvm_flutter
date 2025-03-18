import 'package:flutter/cupertino.dart';
import 'package:mvvm_flutter/domain/entities/todo_entity.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
