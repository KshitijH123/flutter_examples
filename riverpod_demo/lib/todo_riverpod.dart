import 'package:riverpod/riverpod.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<Map<String, String>>>(
      (ref) => TodoNotifier(),
    );

class TodoNotifier extends StateNotifier<List<Map<String, String>>> {
  TodoNotifier() : super([]);

  void addTodo(String title, String desc) {
    state = [
      ...state,
      {'title': title, 'desc': desc},
    ];
  }

  void deleteTodo(int index) {
    final newList = [...state]..removeAt(index);
    state = newList;
  }
}
