import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final Dio dio;

  TodoRepositoryImpl(this.dio);

  @override
  Future<List<TodoEntity>> fetchTodos() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/todos');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error fetching todos: $e');
    }
  }
}
