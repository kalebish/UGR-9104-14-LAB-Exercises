import 'package:bloc_todos/main.dart';
import 'package:bloc_todos/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TodoEvent {}

class FetchTodos extends TodoEvent {}

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<ToDo> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final String endpoint = 'https://jsonplaceholder.typicode.com/todos';
  TodoBloc() : super(TodoLoading()) {
    on<FetchTodos>(_onFetchTodos);
  }

  Future<void> _onFetchTodos(FetchTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await _fetchTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Failed to load todos'));
    }
  }

  Future<List<ToDo>> _fetchTodos() async {
    final Uri url = Uri.parse(endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> todosJson = json.decode(response.body);
      return todosJson.map((json) => ToDo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
