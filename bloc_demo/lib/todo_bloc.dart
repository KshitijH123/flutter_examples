import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<AddTodo>((event, emit) {
      final updatedTodos = List<Map<String, String>>.from(state.todos)
        ..add({'title': event.title, 'desc': event.description});
      emit(TodoState(updatedTodos));
    });

    on<DeleteTodo>((event, emit) {
      final updatedTodos = List<Map<String, String>>.from(state.todos)
        ..removeAt(event.index);
      emit(TodoState(updatedTodos));
    });
  }
}
