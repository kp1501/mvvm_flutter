import 'package:go_router/go_router.dart';

import '../../domain/entities/todo_entity.dart';
import '../../presentation/pages/todo_screen.dart';
import '../presentation/pages/detail_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TodoScreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final todo = state.extra as TodoEntity;
        return DetailScreen(todo: todo);
      },
    ),
  ],
);
