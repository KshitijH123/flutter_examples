abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;
  final String description;

  AddTodo(this.title, this.description);
}

class DeleteTodo extends TodoEvent {
  final int index;

  DeleteTodo(this.index);
}
