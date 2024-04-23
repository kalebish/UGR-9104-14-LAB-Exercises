import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos/todo_model.dart';
import 'package:http/http.dart' as http;



class ApiService {
  String endpoint = 'https://jsonplaceholder.typicode.com/todos';


 Future<List<ToDo>> fetchTodos() async {
    final response =
        await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
     return  data.map((json) => ToDo.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load todos.");
    }
  }

}

final apiProvider = Provider<ApiService>((ref) => ApiService());

final todosProvider = FutureProvider<List<ToDo>>((ref) async {
  return ref.watch(apiProvider).fetchTodos();
});


