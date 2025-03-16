import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/todo_entity.dart';
import '../../../domain/usecases/todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchTodosUseCase fetchTodosUseCase;

  TodoBloc(this.fetchTodosUseCase) : super(TodoInitial()) {
    on<FetchTodosEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await fetchTodosUseCase();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
