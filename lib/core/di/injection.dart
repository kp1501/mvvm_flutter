import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/repositories/todo_repository.dart';
import '../../domain/usecases/todo_usecase.dart';
import '../../presentation/blocs/todo/todo_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Dio Instance
  sl.registerLazySingleton(() => Dio());

  // Repository
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl<Dio>()));

  // UseCase
  sl.registerLazySingleton(() => FetchTodosUseCase(sl<TodoRepository>()));

  // Bloc
  sl.registerFactory(() => TodoBloc(sl<FetchTodosUseCase>()));
}
